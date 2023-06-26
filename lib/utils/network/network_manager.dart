import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:misxV2/utils/database/hive_manager.dart';

import '../constants.dart';

class NetworkManager extends GetxController {
  RxString responseData = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Token Test
  testToken(String api) async {
    responseData.value = await getToken();
    // responseData.value = await setToken();
  }

  requestApi(String api, String params, BuildContext context) async {
    // authDio(context);
    responseData.value = await CallApi(api, params);
  }
}

Future<void> setToken() async {
  var options = BaseOptions(
    baseUrl: CERT_URL_PROD,
    contentType: 'application/json',
    connectTimeout: CONNECT_TIMEOUT, // 5s
    receiveTimeout: RECEIVE_TIMEOUT, // 3s
  );

  Dio dio = Dio(options);

  var authAccount = {"id": "diony-xps", "password": "!@!diony-xps1234", "client-id": "Ym9uYS02NVNVN0ppazY0dUk3SWFNN0lxa0xWaFFVMEJBUUVCQVFFQkEtaQ=="};

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e); //continue
  }));

  try {
    Response response = await dio.post(CERT_TOKEN, data: authAccount);

    // internal DB Write
    await Hive.box(LOCAL_DB).put(KEY_SAVED_TOKEN, response.data);
  } catch (e) {
    Exception(e);
  }
}

Future<String> CallApi(api, params) async {
  var options = BaseOptions(
    baseUrl: CERT_URL_PROD,
    headers: {'Authorization': 'Bearer Token'},
    connectTimeout: CONNECT_TIMEOUT, // 5s
    receiveTimeout: RECEIVE_TIMEOUT, // 3s
  );

  Dio dio = Dio(options);

  var authAccount = {"id": "diony-xps", "password": "!@!diony-xps1234", "client-id": "Ym9uYS02NVNVN0ppazY0dUk3SWFNN0lxa0xWaFFVMEJBUUVCQVFFQkEtaQ=="};

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e); //continue
  }));

  try {
    Response response = await dio.post(CERT_TOKEN, data: authAccount);
    return response.data[TAG_DATA].toString();
  } catch (e) {
    Exception(e);
    return e.toString();
  }
}

Future<Dio> authDio(BuildContext context) async {
  var dio = Dio();

  //final storage = new FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    // 기기에 저장된 AccessToken 로드
    //final accessToken = await storage.read(key: TAG_ACCESS_TOKEN);

    // 매 요청마다 헤더에 AccessToken을 포함
    //options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }, onError: (error, handler) async {
    // 인증 오류가 발생했을 경우: AccessToken의 만료
    if (error.response?.statusCode == 401) {
      // 기기에 저장된 AccessToken과 RefreshToken 로드
      //final accessToken = await storage.read(key: TAG_ACCESS_TOKEN);
      //final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

      // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
      var refreshDio = Dio();

      refreshDio.interceptors.clear();

      refreshDio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
        // 다시 인증 오류가 발생했을 경우: RefreshToken의 만료
        return handler.next(error);
      }));

      // 토큰 갱신 API 요청 시 AccessToken(만료), RefreshToken 포함
      //refreshDio.options.headers['Authorization'] = 'Bearer $accessToken';
      //refreshDio.options.headers['Refresh'] = 'Bearer $refreshToken';

      // 토큰 갱신 API 요청
      final refreshResponse = await refreshDio.get('/token/refresh');

      // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
      final newAccessToken = refreshResponse.headers['Authorization']![0];
      //final newRefreshToken = refreshResponse.headers['Refresh']![0];

      // 기기에 저장된 AccessToken과 RefreshToken 갱신
      //await storage.write(key: TAG_ACCESS_TOKEN, value: newAccessToken);

      // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
      error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      // 수행하지 못했던 API 요청 복사본 생성
      final clonedRequest = await dio.request(error.requestOptions.path,
          options: Options(method: error.requestOptions.method, headers: error.requestOptions.headers),
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters);

      // API 복사본으로 재요청
      return handler.resolve(clonedRequest);
    }

    return handler.next(error);
  }));

  return dio;
}
