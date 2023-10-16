// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_monthly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportMonthlyModel _$ReportMonthlyModelFromJson(Map<String, dynamic> json) =>
    ReportMonthlyModel(
      json['branchCode'],
      json['code'],
      json['name'],
      ChartSpot.fromJson(json['sales'] as Map<String, dynamic>),
      json['total'],
    );

Map<String, dynamic> _$ReportMonthlyModelToJson(ReportMonthlyModel instance) =>
    <String, dynamic>{
      'branchCode': instance.branchCode,
      'code': instance.code,
      'name': instance.name,
      'sales': instance.sales.toJson(),
      'total': instance.total,
    };
