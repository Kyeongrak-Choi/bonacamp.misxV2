import 'package:hive/hive.dart';
import 'package:misxV2/utils/utillity.dart';

// Data Insert
Future<void> UserInfoBoxInit() async {
  await Hive.openBox('USER_INFO');
  //await Hive.box('USER_INFO').put('testKey', 'testValue');

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
bool getHiveBool(bool data){
  if(data == true) {
    return true;
  } else {
    return false;
  }
}