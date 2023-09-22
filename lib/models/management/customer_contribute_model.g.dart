// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_contribute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerContributeModel _$CustomerContributeModelFromJson(
        Map<String, dynamic> json) =>
    CustomerContributeModel(
      json['supplement-amount'] as String?,
      json['purchase-amount'] as String?,
      json['profit-rate'] as String?,
      json['profit-amount'] as String?,
      json['management-total-amount'] as String?,
      json['finance-amount'] as String?,
      json['asset-fix-amount'] as String?,
      json['cost-total-amount'] as String?,
      json['bond-balance'] as String?,
      json['rental-balance'] as String?,
      json['rental-amount'] as String?,
      json['rental-asset-quantity'] as String?,
      json['contribute-amount'] as String?,
      json['customer-count'] as String?,
      json['management-amount'] as String?,
      json['consumption-asset-quantity'] as String?,
      json['transaction-start-date'] as String?,
      json['transaction-last-date'] as String?,
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
      'cost-total-amount': instance.costTotalAmount,
      'bond-balance': instance.bondBalance,
      'rental-balance': instance.rentalBalance,
      'rental-amount': instance.rentalAmount,
      'rental-asset-quantity': instance.rentalAssetQuantity,
      'contribute-amount': instance.contributeAmount,
      'customer-count': instance.customerCount,
      'management-amount': instance.managementAmount,
      'consumption-asset-quantity': instance.consumptionAssetQuantity,
      'transaction-start-date': instance.transactionStartDate,
      'transaction-last-date': instance.transactionLastDate,
    };
