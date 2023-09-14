// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToKenModel _$ToKenModelFromJson(Map<String, dynamic> json) => ToKenModel(
      json['grant_type'] as String,
      json['access_token'] as String,
      json['access_token_expiration_time'] as int,
      json['issue_date'] as String,
    );

Map<String, dynamic> _$ToKenModelToJson(ToKenModel instance) =>
    <String, dynamic>{
      'grant_type': instance.grant_type,
      'access_token': instance.access_token,
      'access_token_expiration_time': instance.access_token_expiration_time,
      'issue_date': instance.issue_date,
    };
