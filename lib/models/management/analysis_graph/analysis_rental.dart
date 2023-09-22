import 'package:json_annotation/json_annotation.dart';

part 'analysis_rental.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisRentalModel {
  String? searchDate; // 연월
  String? dateName; // 연월명
  String? amount; // 매입액

  AnalysisRentalModel(this.searchDate, this.dateName, this.amount);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'amount': amount,
    };
  }

  factory AnalysisRentalModel.fromJson(Map<String, dynamic> json) => _$AnalysisRentalModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisRentalModelToJson(this);
}
