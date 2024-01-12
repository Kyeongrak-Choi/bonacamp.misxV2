import 'package:json_annotation/json_annotation.dart';

part 'analysis_asset.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisAssetModel {
  var searchDate; // 연월
  var dateName; // 연월명
  var amount; // 매입액

  AnalysisAssetModel(this.searchDate, this.dateName, this.amount);

  Map<String, dynamic> toMap() {
    return {
      'search-date': searchDate,
      'date-name': dateName,
      'amount': amount,
    };
  }

  factory AnalysisAssetModel.fromJson(Map<String, dynamic> json) =>
      _$AnalysisAssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisAssetModelToJson(this);
}
