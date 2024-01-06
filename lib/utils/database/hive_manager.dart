import 'package:hive/hive.dart';
import 'package:misxV2/models/system/common.dart';
import 'package:misxV2/models/system/warehouse.dart';

import '../../models/system/branch.dart';
import '../../models/system/employee.dart';
import '../../models/system/team.dart';
import '../../models/system/userinfo.dart';
import '../constants.dart';

void RegisterAdapter() {
  Hive.registerAdapter(UserinfoModelAdapter());
  Hive.registerAdapter(EmployeeModelAdapter());
  Hive.registerAdapter(BranchModelAdapter());
  Hive.registerAdapter(TeamModelAdapter());
  Hive.registerAdapter(WarehouseModelAdapter());
  Hive.registerAdapter(CommonModelAdapter());
}

// Hive DB Initialize
Future<void> BoxInit() async {
  await Hive.openBox(LOCAL_DB);
}

Future<void> BoxClear() async {
  await Hive.openBox(LOCAL_DB);
  await Hive.box(LOCAL_DB).put(KEY_USERINFO, '');
  await Hive.box(LOCAL_DB).put(KEY_EMPLOYEE, '');
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
  String token =
      await Hive.box(LOCAL_DB).get(KEY_SAVED_TOKEN, defaultValue: 'fail');

  if (token == 'fail') {
    return 'GetToken() Failed';
  } else {
    return token;
  }
}
