// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_ledger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesLedgerModel _$SalesLedgerModelFromJson(Map<String, dynamic> json) =>
    SalesLedgerModel(
      json['code'],
      json['name'],
      (json['list'] as List<dynamic>)
          .map((e) => SalesLedgerListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalesLedgerModelToJson(SalesLedgerModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'list': instance.dateList.map((e) => e.toJson()).toList(),
    };
