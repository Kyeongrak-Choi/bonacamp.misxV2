import 'package:hive/hive.dart';

import '../../models/userinfo.dart';

void RegisterAdapter(){
  Hive.registerAdapter(UserinfoModelAdapter());
}

Future<void> OpenBox() async {
  await Hive.openBox('USER_INFO');
  await Hive.openBox('SAL_CHRG_CD');
  await Hive.openBox('NODE_CD');
  await Hive.openBox('TEAM_CD');
  await Hive.openBox('WH_CD');
}

// Data Delete
Future<void> ClearBox() async {
  await Hive.box('USER_INFO').clear();
  await Hive.box('SAL_CHRG_CD').clear();
  await Hive.box('NODE_CD').clear();
  await Hive.box('TEAM_CD').clear();
  await Hive.box('WH_CD').clear();
}

// return Bool Data
bool getHiveBool(bool data) {
  if (data == true) {
    return true;
  } else {
    return false;
  }
}
