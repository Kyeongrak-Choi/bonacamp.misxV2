import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:misxV2/utils/snackbar.dart';

import '../constants.dart';

class RequestController extends GetxController {
  var responseData;

  @override
  void onInit() {
    super.onInit();
    responseData = ''.obs;
  }

  RequestApi(String api, String params) async {
    responseData = await CallApi(api, params);
  }
}

Future<Object> CallApi(api, params) async {
  try {
    var url = Uri.parse(api);
    var response =
        await http.get(url).timeout(Duration(seconds: 10), onTimeout: () {
      ShowSnackBar('e', 'Request failed : ${api}\nstatus: 500');
      return http.Response('Error', 500);
    });
    //var response = await http.get(url,headers: header add);
    var responseData;
    if (response.statusCode == 200) {
      responseData = jsonDecode(utf8.decode(response.bodyBytes));
      // switch (api) {
      //   case HealthCheck:
      //     //ShowSnackBar('i', HealthCheck);
      //
      //     break;
      // }
      return responseData.toString().obs;
    } else {
      ShowSnackBar(
          'e', 'Request failed : ${api}\nstatus: ${responseData[MsgTag]}');
      return false.obs;
    }
  } catch (e) {
    ShowSnackBar('e', 'Request failed : ${api}\nstatus: 500');
    return false.obs;
  }
}
