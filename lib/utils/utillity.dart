import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

Future<String> jsonDummy(String path) async {
  return rootBundle.loadString(path);
}
