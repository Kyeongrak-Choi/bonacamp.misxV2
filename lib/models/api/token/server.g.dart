// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerModel _$ServerModelFromJson(Map<String, dynamic> json) => ServerModel(
      json['SERVER_CODE'] as String,
      json['SERVER_NAME'] as String,
      json['RESORUCE_URL'] as String,
      json['MEMO'] as String,
      (json['ROLE_IDS'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServerModelToJson(ServerModel instance) =>
    <String, dynamic>{
      'SERVER_CODE': instance.SERVER_CODE,
      'SERVER_NAME': instance.SERVER_NAME,
      'RESORUCE_URL': instance.RESORUCE_URL,
      'MEMO': instance.MEMO,
      'ROLE_IDS': instance.ROLE_IDS,
    };
