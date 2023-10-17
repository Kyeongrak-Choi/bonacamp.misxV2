// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesperson_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPersonReportModel _$SalesPersonReportModelFromJson(Map<String, dynamic> json) => SalesPersonReportModel(
      json['branch-code'],
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

Map<String, dynamic> _$SalesPersonReportModelToJson(SalesPersonReportModel instance) => <String, dynamic>{
      'branch-code': instance.branchCode,
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
