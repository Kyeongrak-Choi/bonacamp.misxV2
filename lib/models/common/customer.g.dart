// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      json['custCd'] as String,
      json['custNm'] as String,
      json['custAbbNm'] as String,
      json['custStat'] as String,
      json['custStatNm'] as String,
      json['bizItm'] as String,
      json['bizItmNm'] as String,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'custCd': instance.custCd,
      'custNm': instance.custNm,
      'custAbbNm': instance.custAbbNm,
      'custStat': instance.custStat,
      'custStatNm': instance.custStatNm,
      'bizItm': instance.bizItm,
      'bizItmNm': instance.bizItmNm,
    };
