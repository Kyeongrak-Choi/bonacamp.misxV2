import 'package:json_annotation/json_annotation.dart';

import 'overallasset.dart';
import 'overalldeposit.dart';
import 'overallpurchase.dart';
import 'overallrental.dart';
import 'overallreturn.dart';
import 'overallsales.dart';
import 'overallwithdraw.dart';

part 'overall.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllModel {
  OverAllSalesModel overAllSales; // 종합현황 - 매출
  OverAllPurchaseModel overAllPuchase; // 종합현황 - 매입
  OverAllDepositModel overAllDeposit; // 종합현황 - 입금
  OverAllWithdrawModel overAllWithdraw; // 종합현황 - 출금
  OverAllReturnModel overAllReturn; // 종합현황 - 반납
  OverAllRentalModel overAllRentall; // 종합현황 - 대여금
  OverAllAssetModel overAllAsset; // 종합현황 - 대여자산

  OverAllModel(
        this.overAllSales
      , this.overAllPuchase
      , this.overAllDeposit
      , this.overAllWithdraw
      , this.overAllReturn
      , this.overAllRentall
      , this.overAllAsset );

  Map<String, dynamic> toMap() {
    return {
      'overAllSales': overAllSales,
      'overAllPuchase': overAllPuchase,
      'overAllDeposit': overAllDeposit,
      'overAllWithdraw': overAllWithdraw,
      'overAllReturn': overAllReturn,
      'overAllRentall': overAllRentall,
      'overAllAsset': overAllAsset,
    };
  }

  factory OverAllModel.fromJson(Map<String, dynamic> json) => _$OverAllModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllModelToJson(this);
}
