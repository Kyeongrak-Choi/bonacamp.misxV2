// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReportModel _$CustomerReportModelFromJson(Map<String, dynamic> json) => CustomerReportModel(
      json['branch-code'],
      json['customer-code'],
      json['customer-name'],
      json['total'],
      json['price'],
      json['amount'],
      json['deposit'],
      json['balance'],
      json['margin'],
      json['margin-rate'],
    );

Map<String, dynamic> _$CustomerReportModelToJson(CustomerReportModel instance) => <String, dynamic>{
      'branch-code': instance.branchCode,
      'customer-code': instance.customerCode,
      'customer-name': instance.customerName,
      'total': instance.total,
      'price': instance.price,
      'amount': instance.amount,
      'deposit': instance.deposit,
      'balance': instance.balance,
      'margin': instance.margin,
      'margin-rate': instance.marginRate,
    };
