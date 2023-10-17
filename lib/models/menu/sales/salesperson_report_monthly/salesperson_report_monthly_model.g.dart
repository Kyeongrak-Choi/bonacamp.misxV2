// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesperson_report_monthly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPersonReportMonthlyModel _$ReportMonthlyModelFromJson(Map<String, dynamic> json) => SalesPersonReportMonthlyModel(
      json['branch-code'],
      json['code'],
      json['name'],
      ChartSpot.fromJson(json['sales'] as Map<String, dynamic>),
      json['total'],
    );

Map<String, dynamic> _$ReportMonthlyModelToJson(SalesPersonReportMonthlyModel instance) => <String, dynamic>{
      'branch-code': instance.branchCode,
      'code': instance.code,
      'name': instance.name,
      'sales': instance.sales.toJson(),
      'total': instance.total,
    };
