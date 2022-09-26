import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../utillity.dart';

class NetworkManager extends GetxController {
  RxString responseData = ''.obs;

  @override
  void onInit() {
    super.onInit();
   // responseData = ''.obs;
  }

  RequestApi(String api, String params) async {
    responseData.value = await CallApi(api, params);
  }
}

Future<String> CallApi(api, params) async {
  try {
    var url = Uri.parse(api);
    var response =
        await http.get(url).timeout(const Duration(seconds: 3000), onTimeout: () {
      ShowSnackBar('e', 'Request failed : ${api}\nstatus: 500');
      return http.Response('Error', 500);
    });
    //var response = await http.get(url,headers: header add);
    var responseData;
    if (response.statusCode == 200) {
      responseData = jsonDecode(utf8.decode(response.bodyBytes));
      return responseData.toString();
    } else {
      ShowSnackBar(
          'e', 'Request failed : ${api}\nstatus: ${responseData[MsgTag]}');
      return responseData[MsgTag];
    }
  } catch (e) {
    ShowSnackBar('e', 'Request failed : ${api}\nstatus: 500');
    return e.toString();
  }
}
