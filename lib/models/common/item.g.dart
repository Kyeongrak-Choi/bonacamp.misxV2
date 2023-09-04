// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      json['itmCd'] as String,
      json['itmNm'] as String,
      json['itmAbbNm'] as String,
      json['stnd'] as String,
      json['uzFg'] as String,
      json['uzFgNm'] as String,
      json['ut'] as String,
      json['utNm'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'itmCd': instance.itmCd,
      'itmNm': instance.itmNm,
      'itmAbbNm': instance.itmAbbNm,
      'stnd': instance.stnd,
      'uzFg': instance.uzFg,
      'uzFgNm': instance.uzFgNm,
      'ut': instance.ut,
      'utNm': instance.utNm,
    };
