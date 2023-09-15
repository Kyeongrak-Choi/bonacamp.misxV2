// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) =>
    PurchaseModel(
      json['custCd'] as String?,
      json['custNm'] as String?,
      json['reprNm'] as String?,
      json['custStat'] as String?,
      json['custStatNm'] as String?,
      json['bizcnd'] as String?,
      json['indstyp'] as String?,
    );

Map<String, dynamic> _$PurchaseModelToJson(PurchaseModel instance) =>
    <String, dynamic>{
      'custCd': instance.custCd,
      'custNm': instance.custNm,
      'reprNm': instance.reprNm,
      'custStat': instance.custStat,
      'custStatNm': instance.custStatNm,
      'bizcnd': instance.bizcnd,
      'indstyp': instance.indstyp,
    };
