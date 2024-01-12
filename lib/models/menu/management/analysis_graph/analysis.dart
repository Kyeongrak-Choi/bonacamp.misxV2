import 'package:json_annotation/json_annotation.dart';

import 'analysis_asset.dart';
import 'analysis_bond.dart';
import 'analysis_debt.dart';
import 'analysis_purchase.dart';
import 'analysis_rental.dart';
import 'analysis_sales.dart';

part 'analysis.g.dart'; // *.g.dart : in same directory

@JsonSerializable(explicitToJson: true)
class AnalysisModel {
  AnalysisSalesModel analysisSalesModel; // 분석그래프 - 매출
  AnalysisBondModel analysisBondModel; // 분석그래프 - 채권
  AnalysisPurchaseModel analysisPurchaseModel; // 분석그래프 - 매입
  AnalysisDebtModel analysisDebtModel; // 분석그래프 - 채무
  AnalysisRentalModel analysisRentalModell; // 분석그래프 - 대여
  AnalysisAssetModel analysisAssetModel; // 분석그래프 - 대여자산

  AnalysisModel(
      this.analysisSalesModel,
      this.analysisBondModel,
      this.analysisPurchaseModel,
      this.analysisDebtModel,
      this.analysisRentalModell,
      this.analysisAssetModel);

  Map<String, dynamic> toMap() {
    return {
      'sales': analysisSalesModel,
      'bond': analysisBondModel,
      'purchase': analysisPurchaseModel,
      'debt': analysisDebtModel,
      'rental': analysisRentalModell,
      'asset': analysisAssetModel,
    };
  }

  factory AnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$AnalysisModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisModelToJson(this);
}
