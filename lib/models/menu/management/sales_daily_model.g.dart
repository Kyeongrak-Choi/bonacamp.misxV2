// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_daily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesDailyModel _$SalesDailyModelFromJson(Map<String, dynamic> json) => SalesDailyModel(
      json['team-code'] as String?,
      json['team-name'] as String?,
      json['employee-code'] as String?,
      json['employee-name'] as String?,
      json['division-code'] as String?,
      json['division-name'] as String?,
      json['supplement-amount'] as String?,
      json['vat-amount'] as String?,
      json['guarantee-amount'] as String?,
      json['total-amount'] as String?,
      json['purchase-cost'] as String?,
      json['profit-amount'] as String?,
      json['profit-rate'] as String?,
      json['deposit-cash'] as String?,
      json['deposit-empty-case-bottle'] as String?,
      json['deposit-amount'] as String?,
      json['bond-balance'] as String?,
    );

Map<String, dynamic> _$SalesDailyModelToJson(SalesDailyModel instance) => <String, dynamic>{
      'team-code': instance.teamCode,
      'team-name': instance.teamName,
      'employee-code': instance.employeeCode,
      'employee-name': instance.employeeName,
      'division-code': instance.divisionCode,
      'division-name': instance.divisionName,
      'supplement-amount': instance.supplementAmount,
      'vat-amount': instance.vatAmount,
      'guarantee-amount': instance.guaranteeAmount,
      'total-amount': instance.totalAmount,
      'purchase-cost': instance.purchaseCost,
      'profit-amount': instance.profitAmount,
      'profit-rate': instance.profitRate,
      'deposit-cash': instance.depositCash,
      'deposit-empty-case-bottle': instance.depositEmptyCaseBottle,
      'deposit-amount': instance.depositAmount,
      'bond-balance': instance.bondBalance,
    };
