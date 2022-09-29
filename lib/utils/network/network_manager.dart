import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../utility.dart';

class NetworkManager extends GetxController {
  RxString responseData = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  RequestApi(String api, String params) async {
    responseData.value = await CallApi(api, params);
  }
}

Future<String> CallApi(api, params) async {
  try {
    var url = Uri.parse(api);
    var response = await http.get(url).timeout(const Duration(seconds: TIMTOUT),
        onTimeout: () {
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
