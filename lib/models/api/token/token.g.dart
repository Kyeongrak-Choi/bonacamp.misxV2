// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToKenModel _$ToKenModelFromJson(Map<String, dynamic> json) => ToKenModel(
      json['GRANT_TYPE'] as String,
      json['ACCESS_TOKEN'] as String,
      json['ACCESS_TOKEN_EXPIRATION_TIME'] as int,
      json['ISSUE_DATE'] as String,
    );

Map<String, dynamic> _$ToKenModelToJson(ToKenModel instance) =>
    <String, dynamic>{
      'GRANT_TYPE': instance.GRANT_TYPE,
      'ACCESS_TOKEN': instance.ACCESS_TOKEN,
      'ACCESS_TOKEN_EXPIRATION_TIME': instance.ACCESS_TOKEN_EXPIRATION_TIME,
      'ISSUE_DATE': instance.ISSUE_DATE,
    };
