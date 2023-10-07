import 'package:json_annotation/json_annotation.dart';

part 'overallrental.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllRentalModel {
  var lendAmt; // 대여금액
  var inspayLendAmt; // 회수예정금액
  var retrvAmt; // 회수금액
  var remAmt; // 미회수잔액
  var totAmt; // 대여금잔액

  OverAllRentalModel(this.lendAmt, this.inspayLendAmt, this.retrvAmt, this.remAmt, this.totAmt);

  Map<String, dynamic> toMap() {
    return {
      'amount': lendAmt,
      'collect': inspayLendAmt,
      'collect-target': retrvAmt,
      'collect-balance': remAmt,
      'balance': totAmt,
    };
  }

  factory OverAllRentalModel.fromJson(Map<String, dynamic> json) => _$OverAllRentalModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllRentalModelToJson(this);
}
