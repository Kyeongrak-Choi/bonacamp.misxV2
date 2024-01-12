// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseReportModel _$PurchaseReportModelFromJson(Map<String, dynamic> json) =>
    PurchaseReportModel(
      json['code'],
      json['name'],
      json['purchase'],
      json['withdraw'],
      json['balance'],
    );

Map<String, dynamic> _$PurchaseReportModelToJson(
        PurchaseReportModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'purchase': instance.purchase,
      'withdraw': instance.withdraw,
      'balance': instance.balance,
    };
