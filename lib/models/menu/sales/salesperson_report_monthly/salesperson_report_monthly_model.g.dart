// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesperson_report_monthly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPersonReportMonthlyModel _$SalesPersonReportMonthlyModelFromJson(Map<String, dynamic> json) => SalesPersonReportMonthlyModel(
      json['branchCode'],
      json['code'],
      json['name'],
      (json['sales'] as List<dynamic>).map((e) => SalesListModel.fromJson(e as Map<String, dynamic>)).toList(),
      json['total'],
    );

Map<String, dynamic> _$SalesPersonReportMonthlyModelToJson(SalesPersonReportMonthlyModel instance) => <String, dynamic>{
      'branchCode': instance.branchCode,
      'code': instance.code,
      'name': instance.name,
      'sales': instance.sales.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };
