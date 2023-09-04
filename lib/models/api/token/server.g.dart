// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerModel _$ServerModelFromJson(Map<String, dynamic> json) => ServerModel(
      json['server_code'] as String,
      json['server_name'] as String,
      json['resource_url'] as String,
      json['memo'] as String,
      json['status'] as String,
      (json['role_ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServerModelToJson(ServerModel instance) =>
    <String, dynamic>{
      'server_code': instance.server_code,
      'server_name': instance.server_name,
      'resource_url': instance.resource_url,
      'memo': instance.memo,
      'status': instance.status,
      'role_ids': instance.role_ids,
    };
