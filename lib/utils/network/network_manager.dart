import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/src/response.dart' as Res;
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/utility.dart';

import '../../models/token/req_token.dart';
import '../constants.dart';
import '../database/hive_manager.dart';

class NetworkManager extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
}

Future<bool> reqToken(bool isDev) async {
  isDev ? await Hive.box(LOCAL_DB).put(KEY_AUTH_URL, CERT_URL_DEV) : await Hive.box(LOCAL_DB).put(KEY_AUTH_URL, CERT_URL_PROD);

  log('call auth url : ' + await Hive.box(LOCAL_DB).get(KEY_AUTH_URL, defaultValue: 'fail'));

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_AUTH_URL, defaultValue: 'fail'),
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT), // 5s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 3s
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e); //continue
  }));

  try {
    Res.Response response = await dio.post(CERT_AUTH + CERT_TOKEN, data: ReqTokenModel(AUTH_ID, AUTH_PW, AUTH_CLIENT_ID).toMap());

    if (response.statusCode == 200) {
      // target url 저장
      for (var server in jsonDecode(await jsonEncode(response.data))[TAG_DATA][TAG_SERVER]) {
        if (server['server-code'] == API_SERVER_CODE) {
          await Hive.box(LOCAL_DB).put(KEY_BASE_URL, server['resource-url'] + '/api');
        }
      }

      // Access token 저장
      await Hive.box(LOCAL_DB).put(KEY_SAVED_TOKEN,
          response.data[TAG_DATA][TAG_TOKEN][TAG_GRANT_TYPE].toString() + response.data[TAG_DATA][TAG_TOKEN][TAG_ACCESS_TOKEN].toString());

      return true;
    } else {
      return false;
    }
  } catch (e) {
    Exception(e);
    log('error : ' + e.toString());
    return false;
  }
}

Future<Dio> reqLogin() async {
  log('call login url : ' + await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'));

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail')},
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
    // 15s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 10s
  );

  Dio dio = Dio(options);

  // dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
  //   return handler.next(options); //continue
  // }, onResponse: (response, handler) {
  //   return handler.next(response); // continue
  // }, onError: (DioError e, handler) {
  //   return handler.next(e); //continue
  // }));

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioException dioError, ErrorInterceptorHandler errorInterceptorHandler) async {
    if (dioError.response?.statusCode != 200) {
      return errorInterceptorHandler.next(dioError);
    }
    return errorInterceptorHandler.next(dioError);
  }));

  return dio;

  // try {
  //   Res.Response response = await dio.post(API_SYSTEM_LOGIN, data: params);
  //
  //   if (response.statusCode == 200) {
  //     BoxInit(); // local DB Set
  //     UserinfoModel userinfoModel = UserinfoModel.fromJson(response.data[TAG_DATA]);
  //     await Hive.box(LOCAL_DB).put(KEY_USERINFO, userinfoModel);
  //   }
  //   return response.statusCode.toString();
  // } catch (e) {
  //   Exception(e);
  //   log('error : ' + e.toString());
  //   return e.toString();
  // }
}

Future<Dio> reqApi(header) async {
  log('call api url : ' + await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'));

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail'), 'Client-Code': header},
    //headers: {'Authorization': 'Bearer asdasd', 'Client-Code': header},
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
    // 15s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 10s
  );

  Dio dio = Dio(options);

  dio.interceptors.clear();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioException dioError, ErrorInterceptorHandler errorInterceptorHandler) async {
    if (dioError.response?.statusCode == 200) {
    } else if (dioError.response?.statusCode == 401) {
      log('token renewal call');

      // 토큰 갱신 API 요청
      if (await reqToken(true)) {
        // 수행하지 못했던 API 요청 복사본 생성
        final clonedRequest = await dio.request(dioError.requestOptions.path,
            options: Options(
              method: dioError.requestOptions.method,
              headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail'), 'Client-Code': header},
              contentType: Headers.jsonContentType,
            ),
            data: dioError.requestOptions.data,
            queryParameters: dioError.requestOptions.queryParameters);
        // API 복사본으로 재요청
        return errorInterceptorHandler.resolve(clonedRequest);
      } else {
        // 토큰 초기화
        initToken();
        ShowDialog(DIALOG_TYPE.MSG, 'login_expiration'.tr, 'expiration_content'.tr, Get.context);
        Get.toNamed(ROUTE_LOGIN);
      }
    } else {
      return errorInterceptorHandler.next(dioError);
    }
    return errorInterceptorHandler.next(dioError);
  }));

  return dio;
}
