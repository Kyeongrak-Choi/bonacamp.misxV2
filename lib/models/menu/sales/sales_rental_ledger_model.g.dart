// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_rental_ledger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesRentalLedgerModel _$SalesRentalLedgerModelFromJson(
        Map<String, dynamic> json) =>
    SalesRentalLedgerModel(
      json['sales-date'],
      json['memo'],
      json['total'],
      json['price'],
      json['amount'],
      json['deposit'],
      json['balance'],
      json['long-rent'],
      json['short-rent'],
      json['total-rent'],
      json['total-balance'],
    );

Map<String, dynamic> _$SalesRentalLedgerModelToJson(
        SalesRentalLedgerModel instance) =>
    <String, dynamic>{
      'sales-date': instance.salesDate,
      'memo': instance.memo,
      'total': instance.total,
      'price': instance.price,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'balance': instance.balance,
      'long-rent': instance.longRent,
      'short-rent': instance.shortRent,
      'total-rent': instance.totalRent,
      'total-balance': instance.totalBalance,
    };
