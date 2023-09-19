import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart'; // *.g.dart : in same directory

// 사업장 Model
@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 3)
class BranchModel {
  @HiveField(0)
  String? clientCode; // 도매사코드
  @HiveField(1)
  String? clientName; // 도매사명
  @HiveField(2)
  String? branchCode; // 사업장코드
  @HiveField(3)
  String? branchName; // 사업장명
  @HiveField(4)
  String? businessNo; // 사업장 사업자번호
  @HiveField(5)
  String? representative; // 대표자

  BranchModel(this.clientCode, this.clientName, this.branchCode, this.branchName, this.businessNo, this.representative);

  Map<String, dynamic> toMap() {
    return {
      'client-code': clientCode,
      'client-name': clientName,
      'branch-code': branchCode,
      'branch-name': branchName,
      'business-no': businessNo,
      'representative': representative
    };
  }

  factory BranchModel.fromJson(Map<String, dynamic> json) => _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);

  String? get getClientCode => clientCode;

  set setclientCode(String value) {
    clientCode = value;
  }

  String? get getClientName => clientName;

  set setclientName(String value) {
    clientCode = value;
  }

  String? get getBranchCode => branchCode;

  set setBranchCode(String value) {
    branchCode = value;
  }

  String? get getBranchName => branchName;

  set setBranchName(String value) {
    branchName = value;
  }

  String? get getBusinessNo => businessNo;

  set setBusinessNo(String value) {
    businessNo = value;
  }

  String? get getRepresentative => representative;

  set setRepresentative(String value) {
    representative = value;
  }
}
