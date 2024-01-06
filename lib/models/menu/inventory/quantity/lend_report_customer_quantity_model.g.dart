// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lend_report_customer_quantity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendReportCustomerQuantityModel _$LendReportCustomerQuantityModelFromJson(
        Map<String, dynamic> json) =>
    LendReportCustomerQuantityModel(
      json['last-quantity'],
      json['in-quantity'],
      json['out-quantity'],
      json['remain-quantity'],
      json['in-rate'],
      json['remain-rate'],
    );

Map<String, dynamic> _$LendReportCustomerQuantityModelToJson(
        LendReportCustomerQuantityModel instance) =>
    <String, dynamic>{
      'last-quantity': instance.lastQuantity,
      'in-quantity': instance.inQuantity,
      'out-quantity': instance.outQuantity,
      'remain-quantity': instance.remainQuantity,
      'in-rate': instance.inRate,
      'remain-rate': instance.remainRate,
    };
