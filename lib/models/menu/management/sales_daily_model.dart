import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'sales_daily_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesDailyModel {
  var teamCode; //팀코드
  var teamName; //팀명
  var salesRepCode; //영업사원코드
  var salesRepName; //영업사원명
  var dateType; //구분값 (1:일 / 2:월)
  var dateName; //구분명
  var price;  //공급가
  var vat;  //부가세
  var guarantee;  //공병보증금
  var total;  //총합계
  var cost; //매입원가
  var margin; //이익금
  var marginRate; //마진율 시스템 기준설정 A900 : 1.(마진액/매출원가)*100, 2.(마진액/공급가액)*100)
  var depositCash;  //현금입금
  var depositEtc; //용기,공병입금
  var deposit;  //입금합계
  var balance;  //전월/금일채권잔액

  SalesDailyModel(
    this.teamCode,
    this.teamName,
    this.salesRepCode,
    this.salesRepName,
    this.dateType,
    this.dateName,
    this.price,
    this.vat,
    this.guarantee,
    this.total,
    this.cost,
    this.margin,
    this.marginRate,
    this.depositCash,
    this.depositEtc,
    this.deposit,
    this.balance,
  );

  Map<String, dynamic> toMap() {
    return {
      'team-code': teamCode,
      'team-name': teamName,
      'sales-rep-code': salesRepCode,
      'sales-rep-name': salesRepName,
      'date-type': dateType,
      'date-name': dateName,
      'price': price,
      'vat': vat,
      'guarantee': guarantee,
      'total': total,
      'cost': cost,
      'margin': margin,
      'margin-rate': marginRate,
      'deposit-cash': depositCash,
      'deposit-etc': depositEtc,
      'deposit': deposit,
      'balance': balance,
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

  String? get getSalesRepCode => salesRepCode;

  set setSalesRepCode(String value) {
    salesRepCode = value;
  }

  String? get getSalesRepName => salesRepName;

  set setSalesRepName(String value) {
    salesRepName = value;
  }

  String? get getDateType => dateType;

  set setDateType(String value) {
    dateType = value;
  }

  String? get getDateName => dateName;

  set setDateName(String value) {
    dateName = value;
  }

  String? get getPrice => price;

  set setPrice(String value) {
    price = value;
  }

  String? get getVat => vat;

  set setVat(String value) {
    vat = value;
  }

  String? get getGuarantee => guarantee;

  set setGuarantee(String value) {
    guarantee = value;
  }

  String? get getTotal => total;

  set setTotal(String value) {
    total = value;
  }

  String? get getCost => cost;

  set setCost(String value) {
    cost = value;
  }

  String? get getMargin => margin;

  set setMargin(String value) {
    margin = value;
  }

  String? get getMarginRate => marginRate;

  set setMarginRate(String value) {
    marginRate = value;
  }

  String? get getDepositCash => depositCash;

  set setDepositCash(String value) {
    depositCash = value;
  }

  String? get getDepositEtc => depositEtc;

  set setDepositEtc(String value) {
    depositEtc = value;
  }

  String? get getDeposit => deposit;

  set setDeposit(String value) {
    deposit = value;
  }

  String? get getBalance => balance;

  set setBalance(String value) {
    balance = value;
  }
}

class SalesDailyDayMonthModel {
  String? salesRepName;
  String? dateName_D;
  String? price_D;
  String? vat_D;
  String? guarantee_D;
  String? total_D;
  String? cost_D;
  String? margin_D;
  String? depositCash_D;
  String? depositEtc_D;
  String? deposit_D;
  String? balance_D;

  String? dateName_M;
  String? price_M;
  String? vat_M;
  String? guarantee_M;
  String? total_M;
  String? cost_M;
  String? margin_M;
  String? depositCash_M;
  String? depositEtc_M;
  String? deposit_M;
  String? balance_M;
  int? id;

  SalesDailyDayMonthModel(
      this.salesRepName,
      this.dateName_D,
      this.price_D,
      this.vat_D,
      this.guarantee_D,
      this.total_D,
      this.cost_D,
      this.margin_D,
      this.depositCash_D,
      this.depositEtc_D,
      this.deposit_D,
      this.balance_D,
      this.dateName_M,
      this.price_M,
      this.vat_M,
      this.guarantee_M,
      this.total_M,
      this.cost_M,
      this.margin_M,
      this.depositCash_M,
      this.depositEtc_M,
      this.deposit_M,
      this.balance_M,
      {this.id});
}

List<SalesDailyDayMonthModel> generateSalesDailyList(dataList, count) {
  return List.generate(
      count ~/ 2,
      (index) => SalesDailyDayMonthModel(
          dataList[index * 2].salesRepName,
          dataList[index * 2].dateName,
          numberFormat.format(dataList[index * 2].price),
          numberFormat.format(dataList[index * 2].vat),
          numberFormat.format(dataList[index * 2].guarantee),
          numberFormat.format(dataList[index * 2].total),
          numberFormat.format(dataList[index * 2].cost),
          numberFormat.format(dataList[index * 2].margin),
          numberFormat.format(dataList[index * 2].depositCash),
          numberFormat.format(dataList[index * 2].depositEtc),
          numberFormat.format(dataList[index * 2].deposit),
          numberFormat.format(dataList[index * 2].balance),
          dataList[(index * 2) + 1].dateName,
          numberFormat.format(dataList[(index * 2) + 1].price),
          numberFormat.format(dataList[(index * 2) + 1].vat),
          numberFormat.format(dataList[(index * 2) + 1].guarantee),
          numberFormat.format(dataList[(index * 2) + 1].total),
          numberFormat.format(dataList[(index * 2) + 1].cost),
          numberFormat.format(dataList[(index * 2) + 1].margin),
          numberFormat.format(dataList[(index * 2) + 1].depositCash),
          numberFormat.format(dataList[(index * 2) + 1].depositEtc),
          numberFormat.format(dataList[(index * 2) + 1].deposit),
          numberFormat.format(dataList[(index * 2) + 1].balance),
          id: index));
}
