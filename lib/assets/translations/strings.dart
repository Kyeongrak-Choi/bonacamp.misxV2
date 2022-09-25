import 'package:get/get.dart';

import 'ko.dart';

// multi language set
class Strings extends Translations {
  
  @override
  Map<String, Map<String, String>> get keys =>{
    'ko_KR': koKR,
    //'en_US': enUS,
  };
}