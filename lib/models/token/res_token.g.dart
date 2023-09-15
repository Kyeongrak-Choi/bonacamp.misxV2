// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResTokenModel _$ResTokenModelFromJson(Map<String, dynamic> json) =>
    ResTokenModel(
      ToKenModel.fromJson(json['token'] as Map<String, dynamic>),
      (json['server'] as List<dynamic>)
          .map((e) => ServerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResTokenModelToJson(ResTokenModel instance) =>
    <String, dynamic>{
      'token': instance.token.toJson(),
      'server': instance.server.map((e) => e.toJson()).toList(),
    };
