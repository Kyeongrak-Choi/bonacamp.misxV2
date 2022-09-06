import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WebView(
      initialUrl: 'http://www.dionysoserp.com/ex-privacy.html',
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
