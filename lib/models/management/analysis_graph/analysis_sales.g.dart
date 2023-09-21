// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_sales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisSalesModel _$AnalysisSalesModelFromJson(Map<String, dynamic> json) =>
    AnalysisSalesModel(
      json['search-date'] as String?,
      json['date-name'] as String?,
      json['amount'] as String?,
      json['amount2'] as String?,
    );

Map<String, dynamic> _$AnalysisSalesModelToJson(AnalysisSalesModel instance) =>
    <String, dynamic>{
      'search-date': instance.searchDate,
      'date-name': instance.dateName,
      'amount': instance.amount,
      'amount2': instance.amount2,
    };
