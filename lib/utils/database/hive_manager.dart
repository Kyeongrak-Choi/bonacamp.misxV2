import 'package:hive/hive.dart';
import 'package:misxV2/utils/utillity.dart';

Future<void> SystemBoxInit() async {
  await Hive.openBox('SYSTEM');

  // System Option
  await Hive.box('SYSTEM').put('isDark', GetSystemMode()); // theme Mode
  // await Hive.box('SYSTEM').put('savedId', ''); // user Id
  //
  // // Menu Option
  // await Hive.box('SYSTEM').put('isCustomFilter', false); // 거래처 필터링 사용
  // await Hive.box('SYSTEM').put('isCompareFirst', true); // 영업사원 선택시 관리담당 포함
  // await Hive.box('SYSTEM').put('isIncludeSalChrgCd', false); // 초성검색시 첫글자부터 비교
}

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