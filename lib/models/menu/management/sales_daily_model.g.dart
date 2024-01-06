// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_daily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesDailyModel _$SalesDailyModelFromJson(Map<String, dynamic> json) =>
    SalesDailyModel(
      json['team-code'],
      json['team-name'],
      json['sales-rep-code'],
      json['sales-rep-name'],
      json['date-type'],
      json['date-name'],
      json['price'],
      json['vat'],
      json['guarantee'],
      json['total'],
      json['cost'],
      json['margin'],
      json['margin-rate'],
      json['deposit-cash'],
      json['deposit-etc'],
      json['deposit'],
      json['balance'],
    );

Map<String, dynamic> _$SalesDailyModelToJson(SalesDailyModel instance) =>
    <String, dynamic>{
      'team-code': instance.teamCode,
      'team-name': instance.teamName,
      'sales-rep-code': instance.salesRepCode,
      'sales-rep-name': instance.salesRepName,
      'date-type': instance.dateType,
      'date-name': instance.dateName,
      'price': instance.price,
      'vat': instance.vat,
      'guarantee': instance.guarantee,
      'total': instance.total,
      'cost': instance.cost,
      'margin': instance.margin,
      'margin-rate': instance.marginRate,
      'deposit-cash': instance.depositCash,
      'deposit-etc': instance.depositEtc,
      'deposit': instance.deposit,
      'balance': instance.balance,
    };
