import 'package:json_annotation/json_annotation.dart';

part 'analysis_debt.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisDebtModel {
  String? searchDate; // 연월
  String? dateName; // 연월명
  String? amount; // 매입액

  AnalysisDebtModel(this.searchDate, this.dateName, this.amount);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'amount': amount,
    };
  }

  factory AnalysisDebtModel.fromJson(Map<String, dynamic> json) => _$AnalysisDebtModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisDebtModelToJson(this);
}
