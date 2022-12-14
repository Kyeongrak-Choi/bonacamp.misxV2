import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants.dart';

class NetworkManager extends GetxController {
  final storage = const FlutterSecureStorage();

  RxString responseData = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Get Token Info
  getToken(String api) async {
    await InitToken(api,storage);
    responseData.value = await GetToken(storage);
  }

  RequestApi(String api, String params, BuildContext context) async {
    // authDio(context);
    responseData.value = await CallApi(api, params);
  }
}

Future<void> InitToken(String api,storage) async {
  //final storage = new FlutterSecureStorage();

  var options = BaseOptions(
    baseUrl: CERT_URL_DEV,
    contentType : 'application/json',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  Dio dio = Dio(options);

  var testData1 = FormData.fromMap(
      {
        "id": "obman1"
      , "password": "obman1"
      , "client_id": "7Jik67mE66el7KO8"
      });

  var testData2 = {
      "account_id": "obman1"
    , "account_pw": "obman1"
    , "client_id": "7Jik67mE66el7KO8"
  };

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options); //continue
  }, onResponse: (response, handler) {
    return handler.next(response); // continue
  }, onError: (DioError e, handler) {
    return handler.next(e); //continue
  }));

  try {
   Response response = await dio.post(CERT_TOKEN, data: testData2);
   response.data[TAG_DATA][TAG_TOKEN].toString();

   // internal DB Write
   await storage.write(key: TAG_ACCESS_TOKEN, value: response.data[TAG_DATA][TAG_TOKEN].toString());

  } catch (e) {
    Exception(e);
  }
}

Future<String> GetToken(storage) async {
  //final storage = const FlutterSecureStorage();

  return await storage.read(key: TAG_ACCESS_TOKEN).toString();

}

Future<String> CallApi(api, params) async {
  var options = BaseOptions(
    baseUrl: API_URL_DEV,
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
    Response response = await dio.get(API_HEALTH_CHECK);
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
    final accessToken = await storage.read(key: TAG_ACCESS_TOKEN);

    // 매 요청마다 헤더에 AccessToken을 포함
    //options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }, onError: (error, handler) async {
    // 인증 오류가 발생했을 경우: AccessToken의 만료
    if (error.response?.statusCode == 401) {
      // 기기에 저장된 AccessToken과 RefreshToken 로드
      final accessToken = await storage.read(key: TAG_ACCESS_TOKEN);
      //final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

      // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
      var refreshDio = Dio();

      refreshDio.interceptors.clear();

      refreshDio.interceptors
          .add(InterceptorsWrapper(onError: (error, handler) async {
        // 다시 인증 오류가 발생했을 경우: RefreshToken의 만료
        return handler.next(error);
      }));

      // 토큰 갱신 API 요청 시 AccessToken(만료), RefreshToken 포함
      refreshDio.options.headers['Authorization'] = 'Bearer $accessToken';
      //refreshDio.options.headers['Refresh'] = 'Bearer $refreshToken';

      // 토큰 갱신 API 요청
      final refreshResponse = await refreshDio.get('/token/refresh');

      // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
      final newAccessToken = refreshResponse.headers['Authorization']![0];
      //final newRefreshToken = refreshResponse.headers['Refresh']![0];

      // 기기에 저장된 AccessToken과 RefreshToken 갱신
      await storage.write(key: TAG_ACCESS_TOKEN, value: newAccessToken);

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

// Future<String> CallApi(api, params) async {
//   try {
//     var url = Uri.parse(api);
//     var response = await http
//         .get(url)
//         .timeout(const Duration(seconds: CONNECT_TIMEOUT), onTimeout: () {
//       ShowSnackBar(SNACK_TYPE_ERROR, 'Request failed : ${api}\nstatus: 500');
//       return http.Response('Error', 500);
//     });
//     //var response = await http.get(url,headers: header add);
//     var responseData;
//     if (response.statusCode == 200) {
//       responseData = jsonDecode(utf8.decode(response.bodyBytes));
//       return responseData.toString();
//     } else {
//       ShowSnackBar(SNACK_TYPE_ERROR,
//           'Request failed : ${api}\nstatus: ${responseData[TAG_MSG]}');
//       return responseData[TAG_MSG];
//     }
//   } catch (e) {
//     ShowSnackBar(SNACK_TYPE_ERROR, 'Request failed : ${api}\nstatus: 500');
//     return e.toString();
//   }
// }

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
