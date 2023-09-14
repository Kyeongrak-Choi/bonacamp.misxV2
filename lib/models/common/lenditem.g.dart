// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lenditem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendItemModel _$LendItemModelFromJson(Map<String, dynamic> json) => LendItemModel(
      json['LEND_ITM_CD'] as String,
      json['LEND_ITM_NM'] as String,
      json['STND'] as String,
      json['UT'] as String,
      json['UT_NM'] as String,
      json['VES_FG'] as String,
      json['VES_FG_NM'] as String,
      json['EMPTY_BOTL_CD'] as String,
      json['EMPTY_BOTL_NM'] as String,
    );

Map<String, dynamic> _$LendItemModelToJson(LendItemModel instance) => <String, dynamic>{
      'LEND_ITM_CD': instance.LEND_ITM_CD,
      'LEND_ITM_NM': instance.LEND_ITM_NM,
      'STND': instance.STND,
      'UT': instance.UT,
      'UT_NM': instance.UT_NM,
      'VES_FG': instance.VES_FG,
      'VES_FG_NM': instance.VES_FG_NM,
      'EMPTY_BOTL_CD': instance.EMPTY_BOTL_CD,
      'EMPTY_BOTL_NM': instance.EMPTY_BOTL_NM,
    };
