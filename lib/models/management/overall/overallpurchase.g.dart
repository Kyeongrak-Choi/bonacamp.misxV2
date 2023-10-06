// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallpurchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllPurchaseModel _$OverAllPurchaseModelFromJson(Map<String, dynamic> json) => OverAllPurchaseModel(
      json['amount'] as dynamic,
      json['price'] as dynamic,
      json['vat'] as dynamic,
      json['guarantee'] as dynamic,
    );

Map<String, dynamic> _$OverAllPurchaseModelToJson(OverAllPurchaseModel instance) => <String, dynamic>{
      'amount': instance.boTotAmt,
      'price': instance.suppAmt,
      'vat': instance.vatAmt,
      'guarantee': instance.grntAmt,
    };
