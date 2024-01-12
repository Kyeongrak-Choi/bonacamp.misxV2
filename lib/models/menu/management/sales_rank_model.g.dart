// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_rank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesRankModel _$SalesRankModelFromJson(Map<String, dynamic> json) =>
    SalesRankModel(
      json['ranking'],
      json['customer-code'],
      json['customer-name'],
      json['sales-amount'],
      json['supplement-amount'],
      json['profit-amount'],
      json['profit-rate'],
      json['bond-balance'],
      json['total-amount'],
    );

Map<String, dynamic> _$SalesRankModelToJson(SalesRankModel instance) =>
    <String, dynamic>{
      'ranking': instance.ranking,
      'customer-code': instance.customerCode,
      'customer-name': instance.customerName,
      'sales-amount': instance.salesAmount,
      'supplement-amount': instance.supplementAmount,
      'profit-amount': instance.profitAmount,
      'profit-rate': instance.profitRate,
      'bond-balance': instance.bondBalance,
      'total-amount': instance.totalAmount,
    };
