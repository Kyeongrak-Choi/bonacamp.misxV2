// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lend_report_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendReportCustomerModel _$LendReportCustomerModelFromJson(
        Map<String, dynamic> json) =>
    LendReportCustomerModel(
      json['code'],
      json['name'],
      (json['list'] as List<dynamic>)
          .map((e) =>
              LendReportCustomerListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LendReportCustomerModelToJson(
        LendReportCustomerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'list': instance.detailList.map((e) => e.toJson()).toList(),
    };
