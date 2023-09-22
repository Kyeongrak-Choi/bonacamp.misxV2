// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisModel _$AnalysisModelFromJson(Map<String, dynamic> json) => AnalysisModel(
      AnalysisSalesModel.fromJson(json['analysisSalesModel'] as Map<String, dynamic>),
      AnalysisBondModel.fromJson(json['analysisBondModel'] as Map<String, dynamic>),
      AnalysisPurchaseModel.fromJson(json['analysisPurchaseModel'] as Map<String, dynamic>),
      AnalysisDebtModel.fromJson(json['analysisDebtModel'] as Map<String, dynamic>),
      AnalysisRentalModel.fromJson(json['analysisRentalModell'] as Map<String, dynamic>),
      AnalysisAssetModel.fromJson(json['analysisAssetModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnalysisModelToJson(AnalysisModel instance) => <String, dynamic>{
      'analysisSalesModel': instance.analysisSalesModel.toJson(),
      'analysisBondModel': instance.analysisBondModel.toJson(),
      'analysisPurchaseModel': instance.analysisPurchaseModel.toJson(),
      'analysisDebtModel': instance.analysisDebtModel.toJson(),
      'analysisRentalModell': instance.analysisRentalModell.toJson(),
      'analysisAssetModel': instance.analysisAssetModel.toJson(),
    };
