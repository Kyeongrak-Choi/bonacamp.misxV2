import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/models/system/userinfo.dart';

import '../../models/system/branch.dart';
import '../../models/system/employee.dart';
import '../../models/token/req_token.dart';
import '../../models/token/res_token.dart';
import '../constants.dart';
import '../database/hive_manager.dart';
import '../utility.dart';

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
    Response response = await dio.post(CERT_AUTH + CERT_TOKEN, data: ReqTokenModel(AUTH_ID, AUTH_PW, AUTH_CLIENT_ID).toMap());

    if (response.statusCode == 200) {
      // var dataObjsJson = jsonDecode(response.data)[TAG_DATA] as List;
      //
      // log('check : $dataObjsJson');

      // Access token 저장
      await Hive.box(LOCAL_DB).put(KEY_SAVED_TOKEN,
          response.data[TAG_DATA][TAG_TOKEN][TAG_GRANT_TYPE].toString() + response.data[TAG_DATA][TAG_TOKEN][TAG_ACCESS_TOKEN].toString());

      // target url 저장
      await Hive.box(LOCAL_DB).put(KEY_BASE_URL, 'http://172.27.235.104:9030/api'); // test
    }
  } catch (e) {
    Exception(e);
    log('error : ' + e.toString());
    return false;
  }
  return true;
}

Future<String> reqLogin(params) async {
  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail')},
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
    // 5s
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
    Response response = await dio.post(API_SYSTEM_LOGIN, data: params);

    if (response.statusCode == 200) {
      BoxInit(); // local DB Set
      UserinfoModel userinfoModel = UserinfoModel.fromJson(response.data[TAG_DATA]);

      await Hive.box(LOCAL_DB).put(KEY_USERINFO, userinfoModel);

      return response.statusCode.toString();
    } else if (response.statusCode == 401) {
      return '인증 에러';
    } else if (response.statusCode == 400) {
      return '400 에러';
    } else if (response.statusCode == 500) {
      return '시스템 에러';
    } else {
      return response.data[TAG_MSG];
    }
  } catch (e) {
    Exception(e);
    log('error : ' + e.toString());
    return e.toString();
  }
}

Future<void> reqSystem(api, params) async {
  log('req system url : ' + await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail') + api);

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail')},
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
    // 5s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 3s
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e);
  }));

  Response response;

  try {
      response = await dio.get(api);
      log(response.data);

       var parsedData;
      // log('parsedData : ' + parsedData);
      // await Hive.box(LOCAL_DB).put(KEY_SALCHRG, parsedData.map((dataJson) => SalChrgModel.fromJson(dataJson)).toList());
      // log('success');
      log('success');


    //return response.data[TAG_DATA];
  } catch (e) {
    Exception(e);
    //return e.toString();
  }
}


Future<dynamic> reqApi(api, params, method) async {
  log('call url : ' + await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail') + api);
  log('accessToken : ' + await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail'));

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail')},
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT),
    // 5s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 3s
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e);
  }));

  Response response;
  try {
    if (method == API_REQ_GET) {
      response = await dio.get(api, data: params);
    } else {
      response = await dio.post(api, data: params);
    }
    return jsonEncode(response.data);
  } catch (e) {
    Exception(e);
    return e.toString();
  }
}
