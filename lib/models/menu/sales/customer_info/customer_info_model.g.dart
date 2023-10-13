// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerInfoModel _$CustomerInfoModelFromJson(Map<String, dynamic> json) =>
    CustomerInfoModel(
      json['business-no'] as String?,
      json['tel1'] as String?,
      json['tel2'] as String?,
      json['fax'] as String?,
      json['note'] as String?,
      json['address'] as String?,
    );

Map<String, dynamic> _$CustomerInfoModelToJson(CustomerInfoModel instance) =>
    <String, dynamic>{
      'business-no': instance.businessNo,
      'tel1': instance.tel1,
      'tel2': instance.tel2,
      'fax': instance.fax,
      'note': instance.note,
      'address': instance.address,
    };
