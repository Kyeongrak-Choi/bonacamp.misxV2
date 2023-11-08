import 'package:json_annotation/json_annotation.dart';

part 'analysis_sales.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisSalesModel {
  var searchDate; // 연월
  var dateName; // 연월명
  var total; // 매출액
  var supply; // 공급가

  AnalysisSalesModel(this.searchDate, this.dateName, this.total, this.supply);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'total': total,
      'supply': supply,
    };
  }

  factory AnalysisSalesModel.fromJson(Map<String, dynamic> json) => _$AnalysisSalesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisSalesModelToJson(this);
}
