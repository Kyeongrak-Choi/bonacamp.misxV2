// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryReportModel _$InventoryReportModelFromJson(
        Map<String, dynamic> json) =>
    InventoryReportModel(
      json['item-code'],
      json['item-name'],
      json['box-quantity'],
      json['bottle-quantity'],
      json['amount'],
      json['customer-code'],
      json['customer-name'],
      InventoryReportQuantityModel.fromJson(
          json['sales'] as Map<String, dynamic>),
      InventoryReportQuantityModel.fromJson(
          json['purchase'] as Map<String, dynamic>),
      json['package-quantity'],
      json['liquor-type'],
      json['sales-type-code'],
      json['sales-type'],
      json['item-type'],
      json['use-code'],
      json['use'],
    );

Map<String, dynamic> _$InventoryReportModelToJson(
        InventoryReportModel instance) =>
    <String, dynamic>{
      'item-code': instance.itemCode,
      'item-name': instance.itemName,
      'box-quantity': instance.boxQuantity,
      'bottle-quantity': instance.bottleQuantity,
      'amount': instance.amount,
      'customer-code': instance.customerCode,
      'customer-name': instance.customerName,
      'sales': instance.sales.toJson(),
      'purchase': instance.purchase.toJson(),
      'package-quantity': instance.packageQuantity,
      'liquor-type': instance.liquorType,
      'sales-type-code': instance.salesTypeCode,
      'sales-type': instance.salesType,
      'item-type': instance.itemType,
      'use-code': instance.useCode,
    };
