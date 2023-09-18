import 'package:json_annotation/json_annotation.dart';

part 'salesperson_contribute.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesPersonContributeModel {
  String? custCnt; // 거래처수
  String? suppAmt; // 공급가
  String? prmcAmt; // 마진액
  String? marginRate; // 마진율
  String? marginAmt; // 매출이익
  String? mngmtAmt; // 관리 비용
  String? fncAmt; // 금융 비용
  String? assAsAmt; // 자산 수리비
  String? costSum; // 비용 합계
  String? perddBal; // 채권 잔액
  String? balAmt; // 대여금 잔액
  String? assCnt; // 대여 자산
  String? assQty3; // 대여자산 수량
  String? cstrbtPct; // 기여율
  String? assQty4; // 소비자산수량
  String? cstrbtAmt; // 기여금액
  String? totCstrbtAmt; // 기여금액 총합계

  SalesPersonContributeModel(
      this.custCnt,
      this.suppAmt,
      this.prmcAmt,
      this.marginRate,
      this.marginAmt,
      this.mngmtAmt,
      this.fncAmt,
      this.assAsAmt,
      this.costSum,
      this.perddBal,
      this.balAmt,
      this.assCnt,
      this.assQty3,
      this.cstrbtPct,
      this.assQty4,
      this.cstrbtAmt,
      this.totCstrbtAmt);


  Map<String, dynamic> toMap() {
    return {
      'custCnt': custCnt,
      'suppAmt': suppAmt,
      'prmcAmt': prmcAmt,
      'marginRate': marginRate,
      'marginAmt': marginAmt,
      'mngmtAmt': mngmtAmt,
      'fncAmt': fncAmt,
      'assAsAmt': assAsAmt,
      'costSum': costSum,
      'perddBal': perddBal,
      'balAmt': balAmt,
      'assCnt': assCnt,
      'assQty3': assQty3,
      'cstrbtPct': cstrbtPct,
      'assQty4': assQty4,
      'cstrbtAmt': cstrbtAmt,
      'totCstrbtAmt': totCstrbtAmt,
    };
  }

  factory SalesPersonContributeModel.fromJson(Map<String, dynamic> json) => _$SalesPersonContributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPersonContributeModelToJson(this);
}
