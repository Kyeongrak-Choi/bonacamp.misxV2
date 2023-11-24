// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_ledger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseLedgerModel _$PurchaseLedgerModelFromJson(Map<String, dynamic> json) => PurchaseLedgerModel(
      json['code'],
      json['name'],
      json['balance'],
      (json['list'] as List<dynamic>).map((e) => PurchaseLedgerListModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$PurchaseLedgerModelToJson(PurchaseLedgerModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'balance': instance.balance,
      'list': instance.dateList.map((e) => e.toJson()).toList(),
    };
