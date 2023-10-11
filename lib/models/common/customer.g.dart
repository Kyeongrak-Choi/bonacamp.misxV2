// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      json['code'],
      json['name'],
      json['nick-name'],
      json['representative'],
      json['business-no'],
      json['business-type'],
      json['business-item'],
      json['use-type'],
      json['use-type-name'],
      json['status'],
      json['status-name'],
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'nick-name': instance.nickName,
      'representative': instance.representative,
      'business-no': instance.businessNo,
      'business-type': instance.businessType,
      'business-item': instance.businessItem,
      'useType': instance.useType,
      'use-type-name': instance.useTypeName,
      'status': instance.status,
      'status-name': instance.statusName,
    };
