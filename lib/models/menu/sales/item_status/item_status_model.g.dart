// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemStatusModel _$ItemStatusModelFromJson(Map<String, dynamic> json) => ItemStatusModel(
      json['code'],
      json['name'],
      json['status'],
      json['total-box'],
      json['total-bottle'],
      ItemStatusAmountModel.fromJson(json['normal-box'] as Map<String, dynamic>),
      ItemStatusAmountModel.fromJson(json['normal-bottle'] as Map<String, dynamic>),
      ItemStatusAmountModel.fromJson(json['pleasure-box'] as Map<String, dynamic>),
      ItemStatusAmountModel.fromJson(json['pleasure-bottle'] as Map<String, dynamic>),

    );

Map<String, dynamic> _$ItemStatusModelToJson(ItemStatusModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'status': instance.status,
      'total-box': instance.totalBox,
      'total-bottle': instance.totalBottle,
      'normal-box': instance.normalBox.toJson(),
      'normal-bottle': instance.normalBottle.toJson(),
      'pleasure-box': instance.pleasureBox.toJson(),
      'pleasure-bottle': instance.pleasureBottle.toJson(),
    };
