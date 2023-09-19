// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) => CustomerModel(
      json['customer-code'] as String?,
      json['customer-name'] as String?,
      json['customer-nick-name'] as String?,
      json['customer-status-code'] as String?,
      json['customer-status-name'] as String?,
      json['business-type-code'] as String?,
      json['business-type-name'] as String?,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) => <String, dynamic>{
      'customer-code': instance.custCd,
      'customer-name': instance.custNm,
      'customer-nick-name': instance.custAbbNm,
      'customer-status-code': instance.custStat,
      'customer-status-name': instance.custStatNm,
      'business-type-code': instance.bizItm,
      'business-type-name': instance.bizItmNm,
    };
