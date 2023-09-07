import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

import '../../models/token/req_token.dart';
import '../constants.dart';

class NetworkManager extends GetxController {
  RxString responseData = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<String> requestApi(String api, Map params,String method) async {
   return responseData.value = await CallApi(api, params,method);
  }
}

Future<bool> reqToken(bool isDev) async {
  isDev
      ? await Hive.box(LOCAL_DB).put(KEY_AUTH_URL, CERT_URL_DEV)
      : await Hive.box(LOCAL_DB).put(KEY_AUTH_URL, CERT_URL_PROD);

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
    Response response = await dio.post(CERT_AUTH + CERT_TOKEN, data: ReqTokenModel(AUTH_ID,AUTH_PW,AUTH_CLIENT_ID).toMap());

    if (response.statusCode == 200) {
      // var parsedResponse = [];
      // var dataObjsJson = jsonDecode(response.data)[TAG_DATA] as List;
      // parsedResponse = dataObjsJson.map((dataJson) => ResTokenModel.fromJson(dataJson)).toList();

      // Access token 저장
      await Hive.box(LOCAL_DB).put(KEY_SAVED_TOKEN,
          response.data[TAG_DATA][TAG_TOKEN][TAG_GRANT_TYPE].toString() + response.data[TAG_DATA][TAG_TOKEN][TAG_ACCESS_TOKEN].toString());

      // target url 저장
      await Hive.box(LOCAL_DB).put(KEY_BASE_URL,'http://172.27.235.104:9030/api'); // test
    }
  } catch (e) {
    Exception(e);
    log('error : ' + e.toString());
    return false;
  }
  return true;
}



Future<String> CallApi(api, params, method) async {
  log('call url : ' + await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail') + api);
  log('accessToken : ' + await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail'));

  var options = BaseOptions(
    baseUrl: await Hive.box(LOCAL_DB).get(KEY_BASE_URL, defaultValue: 'fail'),
    headers: {'Authorization': await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail')},
    contentType: 'application/json',
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
    if(method == API_REQ_GET){
      Response response = await dio.get(api,data: params);

      log('response success : ' + response.toString());
      log ('response : ' + response.data[TAG_DATA].toString());
      return response.data[TAG_DATA].toString();
      return response.statusCode.toString();
    }else {
      Response response = await dio.post(api,data: params);

      log('response success : ' + response.toString());
      log ('response : ' + response.data[TAG_DATA].toString());
      //return response.data[TAG_DATA].toString();
      return response.statusCode.toString();
    }

  } catch (e) {
    Exception(e);
    log('response fail : ' + e.toString());
    return e.toString();
  }
}
