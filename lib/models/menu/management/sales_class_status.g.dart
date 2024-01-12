// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_class_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesClassStatusModel _$SalesClassStatusModelFromJson(
        Map<String, dynamic> json) =>
    SalesClassStatusModel(
      json['sales-class-code'],
      json['sales-class-name'],
      json['box-quantity'],
      json['bottle-quantity'],
      json['supplement-amount'],
      json['total'],
      json['purchase-amount'],
      json['profit-amount'],
      json['profit-rate'],
      json['profit-standard'],
    );

Map<String, dynamic> _$SalesClassStatusModelToJson(
        SalesClassStatusModel instance) =>
    <String, dynamic>{
      'sales-class-code': instance.salesClassCode,
      'sales-class-name': instance.salesClassName,
      'box-quantity': instance.boxQuantity,
      'bottle-quantity': instance.bottleQuantity,
      'supplement-amount': instance.supplementAmount,
      'total': instance.total,
      'purchase-amount': instance.purchaseAmount,
      'profit-amount': instance.profitAmount,
      'profit-rate': instance.profitRate,
      'profit-standard': instance.profitStandard,
    };
