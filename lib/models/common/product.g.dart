// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['ITM_CD'] as String,
      json['ITM_NM'] as String,
      json['ITM_ABB_NM'] as String,
      json['STND'] as String,
      json['UZ_FG'] as String,
      json['UZ_FG_NM'] as String,
      json['UT'] as String,
      json['UT_NM'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) => <String, dynamic>{
      'ITM_CD': instance.ITM_CD,
      'ITM_NM': instance.ITM_NM,
      'ITM_ABB_NM': instance.ITM_ABB_NM,
      'STND': instance.STND,
      'UZ_FG': instance.UZ_FG,
      'UZ_FG_NM': instance.UZ_FG_NM,
      'UT': instance.UT,
      'UT_NM': instance.UT_NM,
    };
