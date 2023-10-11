// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      json['code'],
      json['name'],
      json['nickName'],
      json['representative'],
      json['businessNo'],
      json['businessType'],
      json['businessItem'],
      json['useType'],
      json['useTypeName'],
      json['status'],
      json['statusName'],
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'nickName': instance.nickName,
      'representative': instance.representative,
      'businessNo': instance.businessNo,
      'businessType': instance.businessType,
      'businessItem': instance.businessItem,
      'useType': instance.useType,
      'useTypeName': instance.useTypeName,
      'status': instance.status,
      'statusName': instance.statusName,
    };
