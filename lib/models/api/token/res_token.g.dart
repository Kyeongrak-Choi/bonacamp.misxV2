// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResTokenModel _$ResTokenModelFromJson(Map<String, dynamic> json) => ResTokenModel(
      ToKenModel.fromJson(json['TOKEN'] as Map<String, dynamic>),
      (json['SERVER'] as List<dynamic>).map((e) => ServerModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$ResTokenModelToJson(ResTokenModel instance) => <String, dynamic>{
      'TOKEN': instance.TOKEN.toJson(),
      'SERVER': instance.SERVER.map((e) => e.toJson()).toList(),
    };
