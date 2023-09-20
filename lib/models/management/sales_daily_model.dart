import 'package:json_annotation/json_annotation.dart';

part 'sales_daily_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesDailyModel {
  String? teamCode; // 팀코드
  String? teamName; // 팀명
  String? employeeCode; // 영업사원코드
  String? employeeName; // 영업사원명
  String? divisionCode; // 구분값 (1:일 / 2:월)
  String? divisionName; // 구분명
  String? supplementAmount; // 공급가
  String? vatAmount;  // 부가세
  String? guaranteeAmount;  // 공병보증금
  String? totalAmount;  // 총합계
  String? purchaseCost; // 매출원가
  String? profitAmount; // 이익금
  String? profitRate; // 마진율 시스템 기준설정 A900 : 1.(마진액/매출원가)*100,  2.(마진액/공급가액)*100)
  String? depositCash;  // 현금입금
  String? depositEmptyCaseBottle; // 용기,공병입금
  String? depositAmount;  // 입금합계
  String? bondBalance;  // 전월/금일채권잔액

  SalesDailyModel(
      this.teamCode,
      this.teamName,
      this.employeeCode,
      this.employeeName,
      this.divisionCode,
      this.divisionName,
      this.supplementAmount,
      this.vatAmount,
      this.guaranteeAmount,
      this.totalAmount,
      this.purchaseCost,
      this.profitAmount,
      this.profitRate,
      this.depositCash,
      this.depositEmptyCaseBottle,
      this.depositAmount,
      this.bondBalance,
      );


  Map<String, dynamic> toMap() {
    return {
      'team-code': teamCode,
      'team-name': teamName,
      'employee-code': employeeCode,
      'employee-name': employeeName,
      'division-code': divisionCode,
      'division-name': divisionName,
      'supplement-amount': supplementAmount,
      'vat-amount': vatAmount,
      'guarantee-amount': guaranteeAmount,
      'total-amount': totalAmount,
      'purchase-cost': purchaseCost,
      'profit-amount': profitAmount,
      'profit-rate': profitRate,
      'deposit-cash': depositCash,
      'deposit-empty-case-bottle': depositEmptyCaseBottle,
      'deposit-amount': depositAmount,
      'bond-balance': bondBalance,
    };
  }

  factory SalesDailyModel.fromJson(Map<String, dynamic> json) => _$SalesDailyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesDailyModelToJson(this);

  String? get getTeamCode => teamCode;

  set setTeamCode(String value) {
    teamCode = value;
  }

  String? get getTeamName => teamName;

  set setTeamName(String value) {
    teamName = value;
  }

  String? get getEmployeeCode => employeeCode;

  set setEmployeeCode(String value) {
    employeeCode = value;
  }

  String? get getEmployeeName => employeeName;

  set setEmployeeName(String value) {
    employeeName = value;
  }

  String? get getDivisionCode => divisionCode;

  set setDivisionCode(String value) {
    divisionCode = value;
  }

  String? get getDivisionName => divisionName;

  set setDivisionName(String value) {
    divisionName = value;
  }

  String? get getSupplementAmount => supplementAmount;

  set setSupplementAmount(String value) {
    supplementAmount = value;
  }

  String? get getVatAmount => vatAmount;

  set setVatAmount(String value) {
    vatAmount = value;
  }

  String? get getGuaranteeAmount => guaranteeAmount;

  set setGuaranteeAmount(String value) {
    guaranteeAmount = value;
  }

  String? get getTotalAmount => totalAmount;

  set setTotalAmount(String value) {
    totalAmount = value;
  }

  String? get getPurchaseCost => purchaseCost;

  set setPurchaseCost(String value) {
    purchaseCost = value;
  }

  String? get getProfitAmount => profitAmount;

  set setProfitAmount(String value) {
    profitAmount = value;
  }

  String? get getProfitRate => profitRate;

  set setProfitRate(String value) {
    profitRate = value;
  }

  String? get getDepositCash => depositCash;

  set setDepositCash(String value) {
    depositCash = value;
  }

  String? get getDepositEmptyCaseBottle => depositEmptyCaseBottle;

  set setDepositEmptyCaseBottle(String value) {
    depositEmptyCaseBottle = value;
  }

  String? get getDepositAmount => depositAmount;

  set setDepositAmount(String value) {
    depositAmount = value;
  }

  String? get getBondBalance => bondBalance;

  set setBondBalance(String value) {
    bondBalance = value;
  }
}
