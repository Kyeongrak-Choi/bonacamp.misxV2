// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      json['code'] as dynamic,
      json['name'] as dynamic,
      json['nick-name'] as dynamic,
      json['standard'] as dynamic,
      json['use-type'] as dynamic,
      json['use-type-name'] as dynamic,
      json['unit'] as dynamic,
      json['unit-name'] as dynamic,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'nick-name': instance.nickName,
      'standard': instance.standard,
      'use-type': instance.useType,
      'use-type-name': instance.useTypeName,
      'unit': instance.unit,
      'unit-name': instance.unitName,
    };
