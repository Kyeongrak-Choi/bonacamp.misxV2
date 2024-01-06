// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_asset_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentAssetHistoryModel _$RentAssetHistoryModelFromJson(
        Map<String, dynamic> json) =>
    RentAssetHistoryModel(
      json['date'],
      json['code'],
      json['name'],
      json['amount'],
      json['type'],
      json['serial-no'],
      json['memo'],
      json['status'],
    );

Map<String, dynamic> _$RentAssetHistoryModelToJson(
        RentAssetHistoryModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'code': instance.code,
      'name': instance.name,
      'amount': instance.amount,
      'type': instance.type,
      'serial-no': instance.serialNo,
      'memo': instance.memo,
      'stauts': instance.status,
    };
