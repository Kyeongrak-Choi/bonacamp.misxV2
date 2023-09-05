import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

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
  isDev
      ? await Hive.box(LOCAL_DB).put(KEY_BASE_URL, CERT_URL_DEV)
      : await Hive.box(LOCAL_DB).put(KEY_BASE_URL, CERT_URL_PROD);

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    contentType: 'application/json',
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT), // 5s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 3s
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
      await Hive.box(LOCAL_DB).put(KEY_BASE_URL, response.data[TAG_DATA][TAG_SERVER][0][TAG_RESOURCE_URL].toString());

      // login api call

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
    connectTimeout: Duration(seconds: CONNECT_TIMEOUT), // 5s
    receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 3s
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError error, handler) async {
    return handler.next(error);
  }));

  try {
    Response response = await dio.post(api);
    return response.data[TAG_DATA].toString();
  } catch (e) {
    Exception(e);
    return e.toString();
  }
}
