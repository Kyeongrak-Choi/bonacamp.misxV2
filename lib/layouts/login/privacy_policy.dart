import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/constants.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WebView(
      initialUrl: POLICY_URL,
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
