import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/database/hive_manager.dart';

import '../../models/api/token/res_token.dart';
import '../constants.dart';

class NetworkManager extends GetxController {
  RxString responseData = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  requestApi(String api, String params, BuildContext context) async {
    responseData.value = await CallApi(api, params);
  }
}

Future<void> reqToken(bool isDev) async {
  isDev ? await Hive.box(LOCAL_DB).put(KEY_BASE_URL, CERT_URL_DEV+API_BASIC) : await Hive.box(LOCAL_DB).put(KEY_BASE_URL, CERT_URL_PROD+API_BASIC);

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    contentType: 'application/json',
    connectTimeout: CONNECT_TIMEOUT, // 5s
    receiveTimeout: RECEIVE_TIMEOUT, // 3s
  );

  Dio dio = Dio(options);

  var authAccount = {"id": AUTH_ID, "password": AUTH_PW, "client-id": AUTH_CLIENT_ID};

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e); //continue
  }));

  try {
    Response response = await dio.post(CERT_AUTH + CERT_TOKEN, data: authAccount);
    // 성공
    if (response.statusCode == 200) {
      // Access token 저장
      await Hive.box(LOCAL_DB).put(KEY_SAVED_TOKEN,
          response.data[TAG_DATA][TAG_TOKEN][TAG_GRANT_TYPE].toString() + response.data[TAG_DATA][TAG_TOKEN][TAG_ACCESS_TOKEN].toString());

      // Resource Url 저장
       await Hive.box(LOCAL_DB).put(KEY_BASE_URL,
           response.data[TAG_DATA][TAG_SERVER][0][TAG_RESOURCE_URL].toString() + API_BASIC);
      log('server : ' + response.data[TAG_DATA][TAG_SERVER][0][TAG_RESOURCE_URL].toString() + API_BASIC);
    }
  } catch (e) {
    Exception(e);
    log('error : ' + e.toString());
  }
}

Future<String> CallApi(api, params) async {

  log('call url : ' + await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail') + api);
  log('accessToken : ' + await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail'));

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail')},
    connectTimeout: CONNECT_TIMEOUT, // 5s
    receiveTimeout: RECEIVE_TIMEOUT, // 3s
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError error, handler) async {
    return handler.next(error);
    // // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
    // var refreshDio = Dio();
    //
    // refreshDio.interceptors.clear();
    //
    // refreshDio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
    //   // 다시 인증 오류가 발생했을 경우: RefreshToken의 만료
    //   return handler.next(error);
    // }));
    //
    // // 토큰 갱신 API 요청 시 AccessToken(만료), RefreshToken 포함
    // refreshDio.options.headers['Authorization'] = 'Bearer $accessToken';
    // //refreshDio.options.headers['Refresh'] = 'Bearer $refreshToken';
    //
    // //final newRefreshToken = refreshResponse.headers['Refresh']![0];
    //
    // // 기기에 저장된 AccessToken과 RefreshToken 갱신
    // //await storage.write(key: TAG_ACCESS_TOKEN, value: newAccessToken);
    //
    // // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
    // //error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
    //
    // // 수행하지 못했던 API 요청 복사본 생성
    // final clonedRequest = await dio.request(error.requestOptions.path,
    //     options: Options(method: error.requestOptions.method, headers: error.requestOptions.headers),
    //     data: error.requestOptions.data,
    //     queryParameters: error.requestOptions.queryParameters);
    //
    // // API 복사본으로 재요청
    // return handler.resolve(clonedRequest);
  }));

  try {
    Response response = await dio.post(api);
    return response.data[TAG_DATA].toString();
  } catch (e) {
    Exception(e);
    return e.toString();
  }
}
