// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_ledger_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesLedgerDetailsModel _$SalesLedgerDetailsModelFromJson(Map<String, dynamic> json) => SalesLedgerDetailsModel(
      json['item-code'],
      json['item-name'],
      json['sales-type'],
      json['sales-type-name'],
      json['box-quantity'],
      json['bottle-quantity'],
      json['total'],
      json['price'],
      json['amount'],
      json['guarantee'],
      json['deposit'],
      json['balance'],
    );

Map<String, dynamic> _$SalesLedgerDetailsModelToJson(SalesLedgerDetailsModel instance) => <String, dynamic>{
      'item-code': instance.itemCode,
      'item-name': instance.itemName,
      'sales-type': instance.salesType,
      'sales-type-name': instance.salesTypeName,
      'box-quantity': instance.boxQuantity,
      'bottle-quantity': instance.bottleQuantity,
      'total': instance.total,
      'price': instance.price,
      'amount': instance.amount,
      'guarantee': instance.guarantee,
      'deposit': instance.deposit,
      'balance': instance.balance,
    };
