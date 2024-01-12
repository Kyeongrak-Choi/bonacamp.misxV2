// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_contribute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerContributeModel _$CustomerContributeModelFromJson(
        Map<String, dynamic> json) =>
    CustomerContributeModel(
      json['supplement-amount'],
      json['purchase-amount'],
      json['profit-rate'],
      json['profit-amount'],
      json['management-total-amount'],
      json['finance-amount'],
      json['asset-fix-amount'],
      json['total'],
      json['bond-balance'],
      json['rental-balance'],
      json['rental-amount'],
      json['rental-asset-quantity'],
      json['contribute-amount'],
      json['customer-count'],
      json['management-amount'],
      json['consumption-asset-quantity'],
      json['start-date'],
      json['last-date'],
    );

Map<String, dynamic> _$CustomerContributeModelToJson(
        CustomerContributeModel instance) =>
    <String, dynamic>{
      'supplement-amount': instance.supplementAmount,
      'purchase-amount': instance.purchaseAmount,
      'profit-rate': instance.profitRate,
      'profit-amount': instance.profitAmount,
      'management-total-amount': instance.managementTotalAmount,
      'finance-amount': instance.financeAmount,
      'asset-fix-amount': instance.assetFixAmount,
      'total': instance.total,
      'bond-balance': instance.bondBalance,
      'rental-balance': instance.rentalBalance,
      'rental-amount': instance.rentalAmount,
      'rental-asset-quantity': instance.rentalAssetQuantity,
      'contribute-amount': instance.contributeAmount,
      'customer-count': instance.customerCount,
      'management-amount': instance.managementAmount,
      'consumption-asset-quantity': instance.consumptionAssetQuantity,
      'start-date': instance.startDate,
      'last-date': instance.lastDate,
    };
