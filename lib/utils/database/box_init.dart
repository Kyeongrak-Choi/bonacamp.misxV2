import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';

import '../../models/localDB/node.dart';
import '../../models/localDB/salchrg.dart';
import '../../models/localDB/userinfo.dart';
import '../constants.dart';
import '../utility.dart';

// USER_INFO Hive DB Insert
Future<void> UserInfoBoxInit() async {
  await Hive.openBox(NM_USERINFO_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_USER))[TAG_DATA] as List;
  await Hive.box(NM_USERINFO_BOX).put(KEY_USERINFO_BOX, parsedData.map((dataJson) => UserinfoModel.fromJson(dataJson)).toList());
}

Future<void> SalChrgBoxInit() async {
  await Hive.openBox(NM_SALCHRG_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_SALCHRG))[TAG_DATA] as List;
  await Hive.box(NM_SALCHRG_BOX).put(KEY_SALCHRG_BOX, parsedData.map((dataJson) => SalChrgModel.fromJson(dataJson)).toList());
}

Future<void> NodeBoxInit() async {
  await Hive.openBox(NM_NODE_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_NODE))[TAG_DATA] as List;
  await Hive.box(NM_NODE_BOX).put(KEY_NODE_BOX, parsedData.map((dataJson) => NodeModel.fromJson(dataJson)).toList());
}

Future<void> TeamCdBoxInit() async {
 // await Hive.openBox('TEAM_CD');
}

Future<void> WhCdBoxInit() async {
 // await Hive.openBox('WH_CD');
}