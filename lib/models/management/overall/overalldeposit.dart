import 'package:json_annotation/json_annotation.dart';

part 'overalldeposit.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllDepositModel {
  var retrvAmt; // 회수액
  var ipTot; // 입금액
  var amt; // 채권잔액

  OverAllDepositModel(this.retrvAmt, this.ipTot, this.amt);

  Map<String, dynamic> toMap() {
    return {
      'collect': retrvAmt,
      'amount': ipTot,
      'balance': amt,
    };
  }

  factory OverAllDepositModel.fromJson(Map<String, dynamic> json) => _$OverAllDepositModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllDepositModelToJson(this);
}
