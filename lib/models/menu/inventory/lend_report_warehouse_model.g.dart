// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lend_report_warehouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendReportWarehouseModel _$LendReportWarehouseModelFromJson(
        Map<String, dynamic> json) =>
    LendReportWarehouseModel(
      json['trans-item-code'],
      json['lend-item-name'],
      json['obtin-quantity'],
      json['standard'],
      json['container'],
      json['container-name'],
      LendReportQuantityModel.fromJson(json['last'] as Map<String, dynamic>),
      LendReportQuantityModel.fromJson(json['current'] as Map<String, dynamic>),
      LendReportQuantityModel.fromJson(json['in'] as Map<String, dynamic>),
      LendReportQuantityModel.fromJson(json['out'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LendReportWarehouseModelToJson(
        LendReportWarehouseModel instance) =>
    <String, dynamic>{
      'trans-item-code': instance.transItemCode,
      'lend-item-name': instance.lendItemName,
      'obtin-quantity': instance.obtinQuantity,
      'standard': instance.standard,
      'container': instance.container,
      'container-name': instance.containerName,
      'last': instance.last.toJson(),
      'current': instance.current.toJson(),
      'in': instance.inventoryIn.toJson(),
      'out': instance.inventoryOut.toJson(),
    };
