import 'package:json_annotation/json_annotation.dart';

part 'analysis_purchase.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisPurchaseModel {
  var searchDate; // 연월
  var dateName; // 연월명
  var total; // 매입액
  var supply; // 매입공급가
  var totalSupply; // 총계(보충보증)

  AnalysisPurchaseModel(this.searchDate, this.dateName, this.total, this.supply, this.totalSupply);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'amount': total,
      'amount2': supply,
      'total-supply': totalSupply,
    };
  }

  factory AnalysisPurchaseModel.fromJson(Map<String, dynamic> json) => _$AnalysisPurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisPurchaseModelToJson(this);
}
