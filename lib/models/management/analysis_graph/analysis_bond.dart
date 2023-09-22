import 'package:json_annotation/json_annotation.dart';

part 'analysis_bond.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisBondModel {
  String? searchDate; // 연월
  String? dateName; // 연월명
  String? amount; // 총금액

  AnalysisBondModel(this.searchDate, this.dateName, this.amount);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'amount': amount,
    };
  }

  factory AnalysisBondModel.fromJson(Map<String, dynamic> json) => _$AnalysisBondModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisBondModelToJson(this);
}
