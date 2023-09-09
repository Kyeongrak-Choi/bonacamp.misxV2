import 'package:json_annotation/json_annotation.dart';

part 'overallrental.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllRentalModel {
  String? lendAmt; // 대여금액
  String? inspayLendAmt; // 회수예정금액
  String? retrvAmt; // 회수금액
  String? remAmt; // 미회수잔액
  String? totAmt; // 대여금잔액

  OverAllRentalModel(this.lendAmt, this.inspayLendAmt, this.retrvAmt, this.remAmt, this.totAmt);

  Map<String, dynamic> toMap() {
    return {
      'lendAmt': lendAmt,
      'inspayLendAmt': inspayLendAmt,
      'retrvAmt': retrvAmt,
      'remAmt': remAmt,
      'totAmt': totAmt,
    };
  }

  factory OverAllRentalModel.fromJson(Map<String, dynamic> json) => _$OverAllRentalModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllRentalModelToJson(this);
}
