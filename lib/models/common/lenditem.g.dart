// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lenditem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendItemModel _$LendItemModelFromJson(Map<String, dynamic> json) => LendItemModel(
      json['code'] as dynamic,
      json['name'] as dynamic,
      json['standard'] as dynamic,
      json['unit'] as dynamic,
      json['unit-name'] as dynamic,
      json['case-code'] as dynamic,
      json['case-name'] as dynamic,
      json['bottle-code'] as dynamic,
      json['bottle-name'] as dynamic,
    );

Map<String, dynamic> _$LendItemModelToJson(LendItemModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'standard': instance.standard,
      'unit': instance.unit,
      'unit-name': instance.unitName,
      'case-code': instance.caseCode,
      'case-name': instance.caseName,
      'bottle-code': instance.bottleCode,
      'bottle-name': instance.bottleName,
    };
