import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:misxV2/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(PrivacyPolicyController());
    return SafeArea(
      bottom: false,
      child: WebViewWidget(
        controller: Get.find<PrivacyPolicyController>()._webViewController!,
      ),

    );

  }
}

class PrivacyPolicyController extends GetxController {

  WebViewController? _webViewController;

  @override
  void onInit() async {
    super.onInit();
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(POLICY_URL))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

}