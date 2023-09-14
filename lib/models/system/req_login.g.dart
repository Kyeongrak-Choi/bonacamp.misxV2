// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqLoginModel _$ReqLoginModelFromJson(Map<String, dynamic> json) => ReqLoginModel(
      json['id'] as String,
      json['password'] as String,
      json['appId'] as String,
    );

Map<String, dynamic> _$ReqLoginModelToJson(ReqLoginModel instance) => <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'appId': instance.appId,
    };
