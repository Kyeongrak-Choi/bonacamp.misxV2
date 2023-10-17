// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesperson_report_monthly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPersonReportMonthlyModel _$SalesPersonReportMonthlyModelFromJson(
        Map<String, dynamic> json) =>
    SalesPersonReportMonthlyModel(
      json['branchCode'],
      json['code'],
      json['name'],
      ChartSpot.fromJson(json['sales'] as Map<String, dynamic>),
      json['total'],
    );

Map<String, dynamic> _$SalesPersonReportMonthlyModelToJson(
        SalesPersonReportMonthlyModel instance) =>
    <String, dynamic>{
      'branchCode': instance.branchCode,
      'code': instance.code,
      'name': instance.name,
      'sales': instance.sales.toJson(),
      'total': instance.total,
    };
