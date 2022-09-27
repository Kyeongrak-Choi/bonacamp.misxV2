import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';

import '../../models/userinfo.dart';
import '../constants.dart';
import '../utility.dart';

// USER_INFO Hive DB Insert
Future<void> UserInfoBoxInit() async {
  await Hive.openBox('USER_INFO');
  var parsedData = jsonDecode(await jsonDummy(DUMMY_USER))[TAG_DATA] as List;
  await Hive.box('USER_INFO').put('user', parsedData.map((dataJson) => UserinfoModel.fromJson(dataJson)).toList());
}

Future<void> SalChrgCdBoxInit() async {
  await Hive.openBox('SAL_CHRG_CD');
}

Future<void> NodeCdBoxInit() async {
  await Hive.openBox('NODE_CD');
}

Future<void> TeamCdBoxInit() async {
  await Hive.openBox('TEAM_CD');
}

Future<void> WhCdBoxInit() async {
  await Hive.openBox('WH_CD');
}