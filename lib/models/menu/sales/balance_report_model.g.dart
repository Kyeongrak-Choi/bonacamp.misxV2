// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceReportModel _$BalanceReportModelFromJson(Map<String, dynamic> json) => BalanceReportModel(
      json['code'],
      json['name'],
      json['total'],
      json['price'],
      json['amount'],
      json['deposit'],
      json['balance'],
      json['margin'],
      json['margin-rate'],
    );

Map<String, dynamic> _$BalanceReportModelToJson(BalanceReportModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'total': instance.total,
      'price': instance.price,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'balance': instance.balance,
      'margin': instance.margin,
      'margin-rate': instance.marginRate,
    };
