import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart' show Brightness, rootBundle;
import 'dart:async' show Future;

Future<String> jsonDummy(String path) async {
  return rootBundle.loadString(path);
}

// System Theme Mode Check
bool GetSystemMode() {
  if (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
    return true;
  } else {
    return false;
  }
}
