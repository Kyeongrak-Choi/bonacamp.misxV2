// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_rental_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceRentalReportModel _$BalanceRentalReportModelFromJson(
        Map<String, dynamic> json) =>
    BalanceRentalReportModel(
      json['code'],
      json['name'],
      json['total'],
      json['price'],
      json['amount'],
      json['deposit'],
      json['balance'],
      json['long-rent'],
      json['short-rent'],
      json['total-rent'],
      json['total-balance'],
      json['rent-quantity'],
      json['consume-quantity'],
      json['margin'],
      json['margin-rate'],
    );

Map<String, dynamic> _$BalanceRentalReportModelToJson(
        BalanceRentalReportModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'total': instance.total,
      'price': instance.price,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'balance': instance.balance,
      'long-rent': instance.longRent,
      'short-rent': instance.shortRent,
      'total-rent': instance.totalRent,
      'total-balance': instance.totalBalance,
      'rent-quantity': instance.rentQuantity,
      'consume-quantity': instance.consumeQuantity,
      'margin': instance.margin,
      'margin-rate': instance.marginRate,
    };
