import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

import '../models/common/customer.dart';

Future<String> getDummy(String path) async {
  //return rootBundle.loadString('assets/json_dummy/customerList');
  return rootBundle.loadString(path);
}


// Future<CustomerList> DummyToString() async {
//   String jsonString = await getDummy();
//   final jsonResponse = json.decode(jsonString);
//   CustomerList customer = new CustomerList.fromJson(jsonResponse);
//   return customer;
// }