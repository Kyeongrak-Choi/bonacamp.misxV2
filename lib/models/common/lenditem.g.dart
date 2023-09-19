// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lenditem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendItemModel _$LendItemModelFromJson(Map<String, dynamic> json) =>
    LendItemModel(
      json['lend-item-code'] as String?,
      json['lend-item-name'] as String?,
      json['standard'] as String?,
      json['unit-code'] as String?,
      json['unit-name'] as String?,
      json['empty-case-bottle-type-code'] as String?,
      json['empty-case-bottle-type-name'] as String?,
      json['empty-bottle-code'] as String?,
      json['empty-bottle-node'] as String?,
    );

Map<String, dynamic> _$LendItemModelToJson(LendItemModel instance) =>
    <String, dynamic>{
      'lend-item-code': instance.lendItmCd,
      'lend-item-name': instance.lendItmNm,
      'standard': instance.stnd,
      'unit-code': instance.ut,
      'unit-name': instance.utNm,
      'empty-case-bottle-type-code': instance.vesFg,
      'empty-case-bottle-type-name': instance.vesFgNm,
      'empty-bottle-code': instance.emptyBotlCd,
      'empty-bottle-node': instance.emptyBotlNm,
    };
