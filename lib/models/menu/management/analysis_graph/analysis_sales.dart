import 'package:json_annotation/json_annotation.dart';

part 'analysis_sales.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisSalesModel {
  String? searchDate; // 연월
  String? dateName; // 연월명
  String? amount; // 매출액
  String? amount2; // 공급가

  AnalysisSalesModel(this.searchDate, this.dateName, this.amount, this.amount2);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'amount': amount,
      'amount2': amount2,
    };
  }

  factory AnalysisSalesModel.fromJson(Map<String, dynamic> json) => _$AnalysisSalesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisSalesModelToJson(this);
}
