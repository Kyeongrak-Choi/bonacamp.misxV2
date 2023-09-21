// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisPurchaseModel _$AnalysisPurchaseModelFromJson(
        Map<String, dynamic> json) =>
    AnalysisPurchaseModel(
      json['search-date'] as String?,
      json['date-name'] as String?,
      json['amount'] as String?,
      json['amount2'] as String?,
      json['total-supplement-amount'] as String?,
    );

Map<String, dynamic> _$AnalysisPurchaseModelToJson(
        AnalysisPurchaseModel instance) =>
    <String, dynamic>{
      'search-date': instance.searchDate,
      'date-name': instance.dateName,
      'amount': instance.amount,
      'amount2': instance.amount2,
      'total-supplement-amount': instance.totalSupplementAmount,
    };
