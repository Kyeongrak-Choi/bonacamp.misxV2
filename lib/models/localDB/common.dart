import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart'; // *.g.dart : in same directory

// 공통코드 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 6)
class CommonModel {
  @HiveField(0)
  String mainCd; // 메인 코드
  @HiveField(1)
  String subCd; // 서브 코드
  @HiveField(2)
  String subNm; // 서브 명
  @HiveField(3)
  String conn1; // 서브 데이터1
  @HiveField(4)
  String conn2; // 서브 데이터2
  @HiveField(5)
  String conn3; // 서브 데이터3
  @HiveField(6)
  String conn4; // 서브 데이터4
  @HiveField(7)
  String conn5; // 서브 데이터5
  @HiveField(8)
  String inqOrd; // 정렬순서

  CommonModel(this.mainCd, this.subCd, this.subNm, this.conn1, this.conn2, this.conn3, this.conn4, this.conn5, this.inqOrd);

  Map<String, dynamic> toMap() {
    return {'mainCd': mainCd, 'subCd': subCd, 'subNm': subNm, 'conn1': conn1, 'conn2': conn2, 'conn3': conn3, 'conn4': conn4, 'conn5': conn5, 'inqOrd': inqOrd};
  }

  factory CommonModel.fromJson(Map<String, dynamic> json) => _$CommonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonModelToJson(this);

  String get getMainCd => mainCd;

  set setMainCd(String value) {
    mainCd = value;
  }

  String get getSubCd => subCd;

  set setSubCd(String value) {
    subCd = value;
  }

  String get getSubNm => subNm;

  set setSubNm(String value) {
    subNm = value;
  }

  String get getConn1 => conn1;

  set setConn1(String value) {
    conn1 = value;
  }

  String get getConn2 => conn2;

  set setConn2(String value) {
    conn2 = value;
  }

  String get getConn3 => conn3;

  set setConn3(String value) {
    conn3 = value;
  }

  String get getConn4 => conn4;

  set setConn4(String value) {
    conn4 = value;
  }

  String get getConn5 => conn5;

  set setConn5(String value) {
    conn5 = value;
  }

  String get getInqOrd => inqOrd;

  set setInqOrd(String value) {
    inqOrd = value;
  }


}
