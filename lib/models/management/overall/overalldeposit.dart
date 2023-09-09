import 'package:json_annotation/json_annotation.dart';

part 'overalldeposit.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllDepositModel {
  String? retrvAmt; // 회수액
  String? ipTot; // 입금액
  String? amt; // 채권잔액

  OverAllDepositModel(this.retrvAmt, this.ipTot, this.amt);

  Map<String, dynamic> toMap() {
    return {
      'retrvAmt': retrvAmt,
      'ipTot': ipTot,
      'amt': amt,
    };
  }

  factory OverAllDepositModel.fromJson(Map<String, dynamic> json) => _$OverAllDepositModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllDepositModelToJson(this);
}
