// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallasset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllAssetModel _$OverAllAssetModelFromJson(Map<String, dynamic> json) => OverAllAssetModel(
      json['new-rental-quantity'] as String?,
      json['new-rental-amount'] as String?,
    );

Map<String, dynamic> _$OverAllAssetModelToJson(OverAllAssetModel instance) => <String, dynamic>{
      'new-rental-quantity': instance.totQty,
      'new-rental-amount': instance.totAmt,
    };
