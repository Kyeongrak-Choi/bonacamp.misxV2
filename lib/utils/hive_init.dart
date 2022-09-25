import 'package:hive/hive.dart';
import 'package:misxV2/utils/utillity.dart';

Future<void> SystemBoxInit() async {
  await Hive.openBox('SYSTEM');

  // System Option
  await Hive.box('SYSTEM').put('isDark', GetSystemMode()); // theme Mode
  await Hive.box('SYSTEM').put('savedId', ''); // user Id

  // Menu Option
  await Hive.box('SYSTEM').put('isCustomFilter', false); // 거래처 필터링 사용
  await Hive.box('SYSTEM').put('isCompareFirst', false); // 영업사원 선택시 관리담당 포함
  await Hive.box('SYSTEM').put('isIncludeSalChrgCd', false); // 초성검색시 첫글자부터 비교
}
