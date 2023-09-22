// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      json['item-code'] as String?,
      json['item-name'] as String?,
      json['item-nick-name'] as String?,
      json['standard'] as String?,
      json['usage-code'] as String?,
      json['usage-name'] as String?,
      json['unit-code'] as String?,
      json['unit-name'] as String?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'item-code': instance.itmCd,
      'item-name': instance.itmNm,
      'item-nick-name': instance.itmAbbNm,
      'standard': instance.stnd,
      'usage-code': instance.uzFg,
      'usage-name': instance.uzFgNm,
      'unit-code': instance.ut,
      'unit-name': instance.utNm,
    };
