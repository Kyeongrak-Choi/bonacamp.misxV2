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

    ever(responseData, (_) {
      print('$_이 변경되었습니다.');
    });

    interval(
      responseData,
          (_) {
        print('$_가 변경되는 중입니다.(1초마다 호출)');
      },
      time: Duration(seconds: 1),
    );
  }

  RequestApi(String api,String params) async {
    responseData = await CallApi(api,params);
  }
}

Future<Object> CallApi(api,params) async {
  var url = Uri.parse(api);
  var response = await http.get(url);
  //var response = await http.get(url,headers: header add);
  var responseData = jsonDecode(utf8.decode(response.bodyBytes));
  if (response.statusCode == 200) {
    switch (api) {
      case HealthCheck:
        ShowSnackBar('i', HealthCheck);
        break;
    }
    return responseData.toString().obs;
  } else {
    ShowSnackBar('e','Request failed : ${api}\nstatus: ${responseData[ParsedMsg]}');
    return false;
  }
}
