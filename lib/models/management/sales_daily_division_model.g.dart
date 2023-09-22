// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_daily_division_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesDailyDivisionModel _$SalesDailyDivisionModelFromJson(
        Map<String, dynamic> json) =>
    SalesDailyDivisionModel(
      json['item-code'] as String?,
      json['item-name'] as String?,
      json['usage-code'] as String?,
      json['usage-name'] as String?,
      json['box-quantity'] as String?,
      json['bottle-quantity'] as String?,
      json['amount'] as String?,
      json['pleasure-box-total-quantity'] as String?,
      json['pleasure-bottle-total-quantity'] as String?,
      json['pleasure-total-amount'] as String?,
      json['normal-box-total-quantity'] as String?,
      json['normal-bottle-total-quantity'] as String?,
      json['normal-total-amount'] as String?,
      json['box-total-quantity'] as String?,
      json['bottle-total-quantity'] as String?,
      json['total-amount'] as String?,
    );

Map<String, dynamic> _$SalesDailyDivisionModelToJson(
        SalesDailyDivisionModel instance) =>
    <String, dynamic>{
      'item-code' : instance.itemCode,
      'item-name' : instance.itemName,
      'usage-code' : instance.usageCode,
      'usage-name' : instance.usageName,
      'box-quantity' : instance.boxQuantity,
      'bottle-quantity' : instance.bottleQuantity,
      'amount' : instance.amount,
      'pleasure-box-total-quantity' : instance.pleasureBoxTotalQuantity,
      'pleasure-bottle-total-quantity' : instance.pleasureBottleTotalQuantity,
      'pleasure-total-amount' : instance.pleasureTotalAmount,
      'normal-box-total-quantity' : instance.normalBoxTotalQuantity,
      'normal-bottle-total-quantity' : instance.normalBottleTotalQuantity,
      'normal-total-amount' : instance.normalTotalAmount,
      'box-total-quantity' : instance.boxTotalQuantity,
      'bottle-total-quantity' : instance.bottleTotalQuantity,
      'total-amount' : instance.totalAmount,
    };
