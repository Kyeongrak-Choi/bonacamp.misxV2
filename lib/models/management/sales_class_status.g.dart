// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_class_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesClassStatusModel _$SalesClassStatusModelFromJson(
        Map<String, dynamic> json) =>
    SalesClassStatusModel(
      json['sales-class-code'] as String?,
      json['sales-class-name'] as String?,
      json['box-quantity'] as String?,
      json['bottle-quantity'] as String?,
      json['supplement-amount'] as String?,
      json['total-amount'] as String?,
      json['purchase-amount'] as String?,
      json['profit-amount'] as String?,
      json['profit-rate'] as String?,
      json['profit-standard'] as String?,
    );

Map<String, dynamic> _$SalesClassStatusModelToJson(
        SalesClassStatusModel instance) =>
    <String, dynamic>{
      'sales-class-code': instance.salesClassCode,
      'sales-class-name': instance.salesClassName,
      'box-quantity': instance.boxQuantity,
      'bottle-quantity': instance.bottleQuantity,
      'supplement-amount': instance.supplementAmount,
      'total-amount': instance.totalAmount,
      'purchase-amount': instance.purchaseAmount,
      'profit-amount': instance.profitAmount,
      'profit-rate': instance.profitRate,
      'profit-standard': instance.profitStandard,
    };
