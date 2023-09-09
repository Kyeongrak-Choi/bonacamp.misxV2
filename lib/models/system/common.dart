import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart'; // *.g.dart : in same directory

// 공통코드 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 6)
class CommonModel {
  @HiveField(0)
  String? mainCode; // 메인 코드
  @HiveField(1)
  int? no; // 코드 순번
  @HiveField(2)
  String? code; // 서브 코드
  @HiveField(3)
  String? name; // 서브 코드 명
  @HiveField(4)
  String? option1; // 옵션 1
  @HiveField(5)
  String? option2; // 옵션 2
  @HiveField(6)
  String? option3; // 옵션 3
  @HiveField(7)
  String? option4; // 옵션 4
  @HiveField(8)
  String? option5; // 옵션 5

  CommonModel(this.mainCode, this.no, this.code, this.name, this.option1, this.option2, this.option3, this.option4, this.option5); // 정렬순서



  Map<String, dynamic> toMap() {
    return {
      'mainCode': mainCode,
      'no': no,
      'code': code,
      'name': name,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'option5': option5
    };
  }

  factory CommonModel.fromJson(Map<String, dynamic> json) => _$CommonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonModelToJson(this);

  String? get getMainCode => mainCode;

  set setMainCode(String value) {
    mainCode = value;
  }

  int? get getNo => no;

  set setNo(int value) {
    no = value;
  }

  String? get getCode => code;

  set setCode(String value) {
    code = value;
  }

  String? get getName => name;

  set setName(String value) {
    name = value;
  }

  String? get getOption1 => option1;

  set setOption1(String value) {
    option1 = value;
  }

  String? get getOption2 => option2;

  set setOption2(String value) {
    option2 = value;
  }

  String? get getOption3 => option3;

  set setOption3(String value) {
    option3 = value;
  }

  String? get getOption4 => option4;

  set setOption4(String value) {
    option4 = value;
  }

  String? get getOption5 => option5;

  set setOption5(String value) {
    option5 = value;
  }


}
