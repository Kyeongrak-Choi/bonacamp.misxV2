import 'package:json_annotation/json_annotation.dart';

part 'analysis_purchase.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisPurchaseModel {
  String? searchDate; // 연월
  String? dateName; // 연월명
  String? amount; // 매입액
  String? amount2; // 매입공급가
  String? totalSupplementAmount; // 총계(보충보증)

  AnalysisPurchaseModel(this.searchDate, this.dateName, this.amount, this.amount2, this.totalSupplementAmount);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'amount': amount,
      'amount2': amount2,
      'total-supplement-amount': totalSupplementAmount,
    };
  }

  factory AnalysisPurchaseModel.fromJson(Map<String, dynamic> json) => _$AnalysisPurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisPurchaseModelToJson(this);
}
