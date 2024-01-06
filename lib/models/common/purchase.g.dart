// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) =>
    PurchaseModel(
      json['customer-code'] as String?,
      json['customer-name'] as String?,
      json['representative'] as String?,
      json['customer-status-code'] as String?,
      json['customer-status-name'] as String?,
      json['business-status'] as String?,
      json['business-type'] as String?,
    );

Map<String, dynamic> _$PurchaseModelToJson(PurchaseModel instance) =>
    <String, dynamic>{
      'customer-code': instance.custCd,
      'customer-name': instance.custNm,
      'representative': instance.reprNm,
      'customer-status-code': instance.custStat,
      'customer-status-name': instance.custStatNm,
      'business-status': instance.bizcnd,
      'business-type': instance.indstyp,
    };
