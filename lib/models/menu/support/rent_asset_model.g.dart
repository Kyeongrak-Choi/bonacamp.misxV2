// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentAssetModel _$RentAssetModelFromJson(Map<String, dynamic> json) => RentAssetModel(
      json['date'],
      json['code'],
      json['name'],
      json['amount'],
      json['type'],
      json['serial-no'],
      json['memo'],
    );

Map<String, dynamic> _$RentAssetModelToJson(RentAssetModel instance) => <String, dynamic>{
      'date': instance.date,
      'code': instance.code,
      'name': instance.name,
      'amount': instance.amount,
      'type': instance.type,
      'serial-no': instance.serialNo,
      'memo': instance.memo,
    };
