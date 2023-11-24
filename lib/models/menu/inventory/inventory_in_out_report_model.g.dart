// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_in_out_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryInOutReportModel _$InventoryInOutReportModelFromJson(Map<String, dynamic> json) => InventoryInOutReportModel(
      json['item-code'],
      json['item-name'],
      json['sales-type-code'],
      json['sales-type'],
      json['customer-code'],
      json['customer-name'],
      InventoryReportQuantityModel.fromJson(json['current'] as Map<String, dynamic>),
      InventoryReportQuantityModel.fromJson(json['last'] as Map<String, dynamic>),
      InventoryReportQuantityModel.fromJson(json['physical'] as Map<String, dynamic>),
      InventoryReportQuantityModel.fromJson(json['in'] as Map<String, dynamic>),
      InventoryReportQuantityModel.fromJson(json['out'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InventoryInOutReportModelToJson(InventoryInOutReportModel instance) => <String, dynamic>{
      'item-code': instance.itemCode,
      'item-name': instance.itemName,
      'sales-type-code': instance.salesTypeCode,
      'sales-type': instance.salesType,
      'customer-code': instance.customerCode,
      'customer-name': instance.customerName,
      'current': instance.current.toJson(),
      'last': instance.last.toJson(),
      'physical': instance.physical.toJson(),
      'in': instance.inventoryIn.toJson(),
      'out': instance.inventoryOut.toJson(),
    };
