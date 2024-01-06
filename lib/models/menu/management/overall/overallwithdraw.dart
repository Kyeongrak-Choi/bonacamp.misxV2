import 'package:json_annotation/json_annotation.dart';

part 'overallwithdraw.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllWithdrawModel {
  var outTot; // 출금액
  var amt; // 채무잔액

  OverAllWithdrawModel(this.outTot, this.amt);

  Map<String, dynamic> toMap() {
    return {
      'amount': outTot,
      'balance': amt,
    };
  }

  factory OverAllWithdrawModel.fromJson(Map<String, dynamic> json) =>
      _$OverAllWithdrawModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllWithdrawModelToJson(this);
}
