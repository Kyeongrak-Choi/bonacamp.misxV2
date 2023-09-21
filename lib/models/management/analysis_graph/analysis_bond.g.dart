// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_bond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisBondModel _$AnalysisBondModelFromJson(Map<String, dynamic> json) =>
    AnalysisBondModel(
      json['search-date'] as String?,
      json['date-name'] as String?,
      json['amount'] as String?,
    );

Map<String, dynamic> _$AnalysisBondModelToJson(AnalysisBondModel instance) =>
    <String, dynamic>{
      'search-date': instance.searchDate,
      'date-name': instance.dateName,
      'amount': instance.amount,
    };
