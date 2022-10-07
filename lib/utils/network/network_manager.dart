import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../constants.dart';
import '../utility.dart';

class NetworkManager extends GetxController {
  RxString responseData = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  RequestApi(String api, String params, BuildContext context) async {
    authDio(context);
    responseData.value = await CallApi2(api, params);
  }
}

Future<String> CallApi(api, params) async {
  try {
    var url = Uri.parse(api);
    var response = await http
        .get(url)
        .timeout(const Duration(seconds: CONNECT_TIMEOUT), onTimeout: () {
      ShowSnackBar(SNACK_TYPE_ERROR, 'Request failed : ${api}\nstatus: 500');
      return http.Response('Error', 500);
    });
    //var response = await http.get(url,headers: header add);
    var responseData;
    if (response.statusCode == 200) {
      responseData = jsonDecode(utf8.decode(response.bodyBytes));
      return responseData.toString();
    } else {
      ShowSnackBar(SNACK_TYPE_ERROR,
          'Request failed : ${api}\nstatus: ${responseData[TAG_MSG]}');
      return responseData[TAG_MSG];
    }
  } catch (e) {
    ShowSnackBar(SNACK_TYPE_ERROR, 'Request failed : ${api}\nstatus: 500');
    return e.toString();
  }
}

// Future<Response> post(
//   String url, {
//   data,
//   Map<String, dynamic>? queryParameters,
//   Options? options,
//   CancelToken? cancelToken,
//   ProgressCallback? onSendProgress,
//   ProgressCallback? onReceiveProgress,
// }) async {
//   try {
//     final Response response = await dio.post(
//       url,
//       data: data,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//       onSendProgress: onSendProgress,
//       onReceiveProgress: onReceiveProgress,
//     );
//     return response;
//   } catch (e) {
//     rethrow;
//   }
// }

Future<String> CallApi2(api, params) async {
  var options = BaseOptions(
    baseUrl: api,
    headers: {'Authorization': 'Bearer Token'},
    connectTimeout: CONNECT_TIMEOUT, // 5s
    receiveTimeout: RECEIVE_TIMEOUT, // 3s
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
    Response response = await dio.get(api);
    //Response response2 = await dio.post(api,queryParameters: );
    return response.data[TAG_DATA].toString();
  } catch (e) {
    Exception(e);
    return e.toString();
  }
}

Future<Dio> authDio(BuildContext context) async {
  var dio = Dio();

  final storage = new FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    // 기기에 저장된 AccessToken 로드
    final accessToken = await storage.read(key: 'ACCESS_TOKEN');

    // 매 요청마다 헤더에 AccessToken을 포함
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }, onError: (error, handler) async {
    // 인증 오류가 발생했을 경우: AccessToken의 만료
    if (error.response?.statusCode == 401) {
      // 기기에 저장된 AccessToken과 RefreshToken 로드
      final accessToken = await storage.read(key: 'ACCESS_TOKEN');
      final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

      // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
      var refreshDio = Dio();

      refreshDio.interceptors.clear();

      refreshDio.interceptors
          .add(InterceptorsWrapper(onError: (error, handler) async {
        // 다시 인증 오류가 발생했을 경우: RefreshToken의 만료
        if (error.response?.statusCode == 401) {
          // 기기의 자동 로그인 정보 삭제
          await storage.deleteAll();

          // . . .
          // 로그인 만료 dialog 발생 후 로그인 페이지로 이동
          // . . .
        }
        return handler.next(error);
      }));

      // 토큰 갱신 API 요청 시 AccessToken(만료), RefreshToken 포함
      refreshDio.options.headers['Authorization'] = 'Bearer $accessToken';
      refreshDio.options.headers['Refresh'] = 'Bearer $refreshToken';

      // 토큰 갱신 API 요청
      final refreshResponse = await refreshDio.get('/token/refresh');

      // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
      final newAccessToken = refreshResponse.headers['Authorization']![0];
      final newRefreshToken = refreshResponse.headers['Refresh']![0];

      // 기기에 저장된 AccessToken과 RefreshToken 갱신
      await storage.write(key: 'ACCESS_TOKEN', value: newAccessToken);
      await storage.write(key: 'REFRESH_TOKEN', value: newRefreshToken);

      // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
      error.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

      // 수행하지 못했던 API 요청 복사본 생성
      final clonedRequest = await dio.request(error.requestOptions.path,
          options: Options(
              method: error.requestOptions.method,
              headers: error.requestOptions.headers),
          data: error.requestOptions.data,
          queryParameters: error.requestOptions.queryParameters);

      // API 복사본으로 재요청
      return handler.resolve(clonedRequest);
    }

    return handler.next(error);
  }));

  return dio;
}
