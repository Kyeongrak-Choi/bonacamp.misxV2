// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallpurchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllPurchaseModel _$OverAllPurchaseModelFromJson(Map<String, dynamic> json) => OverAllPurchaseModel(
      json['purchase-amount'] as String?,
      json['supplement-amount'] as String?,
      json['vat-amount'] as String?,
      json['guarantee-amount'] as String?,
    );

Map<String, dynamic> _$OverAllPurchaseModelToJson(OverAllPurchaseModel instance) => <String, dynamic>{
      'purchase-amount': instance.boTotAmt,
      'supplement-amount': instance.suppAmt,
      'vat-amount': instance.vatAmt,
      'guarantee-amount': instance.grntAmt,
    };
