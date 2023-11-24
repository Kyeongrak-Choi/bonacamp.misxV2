// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_ledger_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseLedgerDetailsModel _$PurchaseLedgerDetailsModelFromJson(Map<String, dynamic> json) => PurchaseLedgerDetailsModel(
      json['item-code'],
      json['item-name'],
      json['box-quantity'],
      json['bottle-quantity'],
      json['total'],
      json['price'],
      json['withdraw'],
      json['balance'],
    );

Map<String, dynamic> _$PurchaseLedgerDetailsModelToJson(PurchaseLedgerDetailsModel instance) => <String, dynamic>{
      'item-code': instance.itemCode,
      'item-name': instance.itemName,
      'box-quantity': instance.boxQuantity,
      'bottle-quantity': instance.bottleQuantity,
      'total': instance.total,
      'price': instance.price,
      'amount': instance.withdraw,
      'balance': instance.balance,
    };
