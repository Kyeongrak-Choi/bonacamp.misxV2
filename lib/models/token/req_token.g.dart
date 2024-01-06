// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqTokenModel _$ReqTokenModelFromJson(Map<String, dynamic> json) =>
    ReqTokenModel(
      json['id'] as String,
      json['password'] as String,
      json['clientId'] as String,
    );

Map<String, dynamic> _$ReqTokenModelToJson(ReqTokenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'clientId': instance.clientId,
    };
