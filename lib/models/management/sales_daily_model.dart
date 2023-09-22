import 'package:intl/intl.dart';
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
  String? vatAmount; // 부가세
  String? guaranteeAmount; // 공병보증금
  String? totalAmount; // 총합계
  String? purchaseCost; // 매출원가
  String? profitAmount; // 이익금
  String? profitRate; // 마진율 시스템 기준설정 A900 : 1.(마진액/매출원가)*100,  2.(마진액/공급가액)*100)
  String? depositCash; // 현금입금
  String? depositEmptyCaseBottle; // 용기,공병입금
  String? depositAmount; // 입금합계
  String? bondBalance; // 전월/금일채권잔액

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

class SalesDailyDayMonthModel {
  String? employeeName; // 영업사원명
  String? divisionName_D; // 구분명
  String? supplementAmount_D; // 공급가
  String? vatAmount_D; // 부가세
  String? guaranteeAmount_D; // 공병보증금
  String? totalAmount_D; // 총합계
  String? purchaseCost_D; // 매출원가
  String? profitAmount_D; // 이익금
  String? depositCash_D; // 현금입금
  String? depositEmptyCaseBottle_D; // 용기,공병입금
  String? depositAmount_D; // 입금합계
  String? bondBalance_D; // 전월/금일채권잔액

  String? divisionName_M; // 구분명
  String? supplementAmount_M; // 공급가
  String? vatAmount_M; // 부가세
  String? guaranteeAmount_M; // 공병보증금
  String? totalAmount_M; // 총합계
  String? purchaseCost_M; // 매출원가
  String? profitAmount_M; // 이익금
  String? depositCash_M; // 현금입금
  String? depositEmptyCaseBottle_M; // 용기,공병입금
  String? depositAmount_M; // 입금합계
  String? bondBalance_M; // 전월/금일채권잔액
  int? id;

  SalesDailyDayMonthModel(
      this.employeeName,
      this.divisionName_D,
      this.supplementAmount_D,
      this.vatAmount_D,
      this.guaranteeAmount_D,
      this.totalAmount_D,
      this.purchaseCost_D,
      this.profitAmount_D,
      this.depositCash_D,
      this.depositEmptyCaseBottle_D,
      this.depositAmount_D,
      this.bondBalance_D,
      this.divisionName_M,
      this.supplementAmount_M,
      this.vatAmount_M,
      this.guaranteeAmount_M,
      this.totalAmount_M,
      this.purchaseCost_M,
      this.profitAmount_M,
      this.depositCash_M,
      this.depositEmptyCaseBottle_M,
      this.depositAmount_M,
      this.bondBalance_M,
      {this.id});
}

List<SalesDailyDayMonthModel> generateSalesDailyList(dataList, count) {
  var f = NumberFormat('###,###,###,###');
  return List.generate(
      count ~/ 2,
      (index) => SalesDailyDayMonthModel(
          dataList[index * 2].employeeName,
          dataList[index * 2].divisionName,
          f.format(int.parse(dataList[index * 2].supplementAmount ?? 0)),
          f.format(int.parse(dataList[index * 2].vatAmount ?? 0)),
          f.format(int.parse(dataList[index * 2].guaranteeAmount ?? 0)),
          f.format(int.parse(dataList[index * 2].totalAmount ?? 0)),
          f.format(int.parse(dataList[index * 2].purchaseCost ?? 0)),
          f.format(int.parse(dataList[index * 2].profitAmount ?? 0)),
          f.format(int.parse(dataList[index * 2].depositCash ?? 0)),
          f.format(int.parse(dataList[index * 2].depositEmptyCaseBottle ?? 0)),
          f.format(int.parse(dataList[index * 2].depositAmount ?? 0)),
          f.format(int.parse(dataList[index * 2].bondBalance ?? 0)),
          dataList[(index * 2) + 1].divisionName,
          f.format(int.parse(dataList[(index * 2) + 1].supplementAmount ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].vatAmount ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].guaranteeAmount ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].totalAmount ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].purchaseCost ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].profitAmount ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].depositCash ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].depositEmptyCaseBottle ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].depositAmount ?? 0)),
          f.format(int.parse(dataList[(index * 2) + 1].bondBalance ?? 0)),
          id: index));
}
