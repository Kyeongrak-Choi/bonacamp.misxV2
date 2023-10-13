import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart'; // *.g.dart : in same directory

// 거래처(매출처) 검색 Model
@JsonSerializable(explicitToJson: true)
class CustomerModel {
  var code; // 거래처코드
  var name; // 거래처 명
  var nickName; // 거래처 약칭
  var representative; // 대표자
  var businessNo; // 사업자번호
  var businessType; // 업태
  var businessItem; //종목
  var useType; // 용도구분
  var useTypeName; // 용도구분명
  var status; // 상태코드
  var statusName; // 상태명

  CustomerModel(this.code, this.name, this.nickName, this.representative, this.businessNo, this.businessType, this.businessItem, this.useType,
      this.useTypeName, this.status, this.statusName);

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'nick-name': nickName,
      'representative': representative,
      'business-no': businessNo,
      'business-type': businessType,
      'business-item': businessItem,
      'use-type': useType,
      'use-type-name': useTypeName,
      'status': status,
      'status-name': statusName,
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

  get getCode => code;

  get getName => name;

  get getNickName => nickName;

  get getStatuaName => statusName;

  get getBusinessItem => businessItem;
}
