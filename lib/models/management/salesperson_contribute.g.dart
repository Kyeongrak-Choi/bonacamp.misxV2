// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesperson_contribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPersonContributeModel _$SalesPersonContributeModelFromJson(Map<String, dynamic> json) => SalesPersonContributeModel(
      json['customer-count'] as String?,
      json['supplement-amount'] as String?,
      json['purchase-amount'] as String?,
      json['profit-rate'] as String?,
      json['profit-amount'] as String?,
      json['management-amount'] as String?,
      json['finance-amount'] as String?,
      json['asset-fix-amount'] as String?,
      json['cost-total-amount'] as String?,
      json['bond-amount'] as String?,
      json['rental-amount'] as String?,
      json['asset-count'] as String?,
      json['rental-asset-quantity'] as String?,
      json['contribute-rate'] as String?,
      json['consumption-asset-quantity'] as String?,
      json['contribute-amount'] as String?,
      json['contribute-total-amount'] as String?,
    );

Map<String, dynamic> _$SalesPersonContributeModelToJson(SalesPersonContributeModel instance) => <String, dynamic>{
      'customer-count': instance.custCnt,
      'supplement-amount': instance.suppAmt,
      'purchase-amount': instance.prmcAmt,
      'profit-rate': instance.marginRate,
      'profit-amount': instance.marginAmt,
      'management-amount': instance.mngmtAmt,
      'finance-amount': instance.fncAmt,
      'asset-fix-amount': instance.assAsAmt,
      'cost-total-amount': instance.costSum,
      'bond-amount': instance.perddBal,
      'rental-amount': instance.balAmt,
      'asset-count': instance.assCnt,
      'rental-asset-quantity': instance.assQty3,
      'contribute-rate': instance.cstrbtPct,
      'consumption-asset-quantity': instance.assQty4,
      'contribute-amount': instance.cstrbtAmt,
      'contribute-total-amount': instance.totCstrbtAmt,
    };
