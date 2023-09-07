import 'package:hive/hive.dart';

import '../../models/system/node.dart';
import '../../models/system/salchrg.dart';
import '../../models/system/team.dart';
import '../../models/system/userinfo.dart';
import '../constants.dart';

void RegisterAdapter() {
  Hive.registerAdapter(UserinfoModelAdapter());
  Hive.registerAdapter(SalChrgModelAdapter());
  Hive.registerAdapter(NodeModelAdapter());
  Hive.registerAdapter(TeamModelAdapter());
}

// Hive DB Initialize
Future<void> BoxInit() async {
  await Hive.openBox(LOCAL_DB);
  var parsedData;

  // // USER_INFO
  // parsedData = jsonDecode(await jsonDummy(DUMMY_USER))[TAG_DATA] as List;
  // await Hive.box(LOCAL_DB).put(KEY_USERINFO, parsedData.map((dataJson) => UserinfoModel.fromJson(dataJson)).toList());
  //
  // // SAL_CHRG
  // parsedData = jsonDecode(await jsonDummy(DUMMY_SALCHRG))[TAG_DATA] as List;
  // await Hive.box(LOCAL_DB).put(KEY_SALCHRG, parsedData.map((dataJson) => SalChrgModel.fromJson(dataJson)).toList());
  //
  // // NODE
  // parsedData = jsonDecode(await jsonDummy(DUMMY_NODE))[TAG_DATA] as List;
  // await Hive.box(LOCAL_DB).put(KEY_NODE, parsedData.map((dataJson) => NodeModel.fromJson(dataJson)).toList());
  //
  // // TEAM
  // parsedData = jsonDecode(await jsonDummy(DUMMY_TEAM))[TAG_DATA] as List;
  // await Hive.box(LOCAL_DB).put(KEY_TEAM, parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());

  // WAREHOUSE
  // parsedData = jsonDecode()[TAG_DATA] as List;
  // await Hive.box(LOCAL_DB).put(KEY_WH,
  //     parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());

  // COMMON
  // parsedData = jsonDecode()[TAG_DATA] as List;
  // await Hive.box(LOCAL_DB).put(KEY_COMMON,
  //     parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());

  // MENU
  // parsedData = jsonDecode()[TAG_DATA] as List;
  // await Hive.box(LOCAL_DB).put(KEY_COMMON,
  //     parsedData.map((dataJson) => TeamModel.fromJson(dataJson)).toList());
}

// return Bool Data
bool getHiveBool(bool data) {
  if (data == true) {
    return true;
  } else {
    return false;
  }
}

// init set token
Future<void> initToken() async {
  await Hive.box(LOCAL_DB).put(KEY_SAVED_TOKEN, '');
}

Future<String> getToken() async {
  String token = await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail');

  if (token == 'fail') {
    return 'GetToken() Failed';
  } else {
    return token;
  }
}
