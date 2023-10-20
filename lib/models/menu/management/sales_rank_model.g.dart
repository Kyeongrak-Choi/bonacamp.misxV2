// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_rank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesRankModel _$SalesRankModelFromJson(Map<String, dynamic> json) => SalesRankModel(
      json['ranking'] as String,
      json['customer-code'] as String?,
      json['customer-name'] as String?,
      json['sales-amount'] as String?,
      json['supplement-amount'] as String?,
      json['profit-amount'] as String?,
      json['profit-rate'] as String?,
      json['bond-balance'] as String?,
      json['total-amount'] as String?,
    );

Map<String, dynamic> _$SalesRankModelToJson(SalesRankModel instance) => <String, dynamic>{
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
