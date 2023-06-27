import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart'; // *.g.dart : in same directory

// 거래처 검색 Model
@JsonSerializable(explicitToJson: true)
class ToKenModel {
  String GRANT_TYPE; //
  String ACCESS_TOKEN; //
  int ACCESS_TOKEN_EXPIRATION_TIME; //
  String ISSUE_DATE; //

  ToKenModel(
    this.GRANT_TYPE,
    this.ACCESS_TOKEN,
    this.ACCESS_TOKEN_EXPIRATION_TIME,
    this.ISSUE_DATE,
  );

  Map<String, dynamic> toMap() {
    return {
      'GRANT_TYPE': GRANT_TYPE,
      'ACCESS_TOKEN': ACCESS_TOKEN,
      'ACCESS_TOKEN_EXPIRATION_TIME': ACCESS_TOKEN_EXPIRATION_TIME,
      'ISSUE_DATE': ISSUE_DATE,
    };
  }

  factory ToKenModel.fromJson(Map<String, dynamic> json) => _$ToKenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToKenModelToJson(this);
}
