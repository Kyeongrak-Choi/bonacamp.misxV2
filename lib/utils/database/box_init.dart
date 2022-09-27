import 'dart:convert';

import 'package:hive/hive.dart';

import '../../models/localDB/node.dart';
import '../../models/localDB/salchrg.dart';
import '../../models/localDB/team.dart';
import '../../models/localDB/userinfo.dart';
import '../constants.dart';
import '../utility.dart';

// USER_INFO Hive DB Insert
Future<void> UserInfoBoxInit() async {
  await Hive.openBox(NM_USERINFO_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_USER))[TAG_DATA] as List;
  await Hive.box(NM_USERINFO_BOX).put(KEY_USERINFO_BOX,
      parsedData.map((dataJson) => UserinfoModel.fromJson(dataJson)).toList());
}

// SAL_CHRG Hive DB Insert
Future<void> SalChrgBoxInit() async {
  await Hive.openBox(NM_SALCHRG_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_SALCHRG))[TAG_DATA] as List;
  await Hive.box(NM_SALCHRG_BOX).put(KEY_SALCHRG_BOX,
      parsedData.map((dataJson) => SalChrgModel.fromJson(dataJson)).toList());
}

// NODE Hive DB Insert
Future<void> NodeBoxInit() async {
  await Hive.openBox(NM_NODE_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_NODE))[TAG_DATA] as List;
  await Hive.box(NM_NODE_BOX).put(KEY_NODE_BOX,
      parsedData.map((dataJson) => NodeModel.fromJson(dataJson)).toList());
}

// TEAM Hive DB Insert
Future<void> TeamBoxInit() async {
  await Hive.openBox(NM_TEAM_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_TEAM))[TAG_DATA] as List;
  await Hive.box(NM_TEAM_BOX).put(KEY_TEAM_BOX,
      parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());
}

// WH Hive DB Insert
Future<void> WhBoxInit() async {
  await Hive.openBox(NM_WH_BOX);
  var parsedData = jsonDecode(await jsonDummy(DUMMY_WH))[TAG_DATA] as List;
  await Hive.box(NM_WH_BOX).put(KEY_WH_BOX,
      parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());
}
