// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_ledger_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesLedgerListModel _$SalesLedgerListModelFromJson(
        Map<String, dynamic> json) =>
    SalesLedgerListModel(
      json['date'],
      json['balance'],
      (json['details'] as List<dynamic>)
          .map((e) =>
              SalesLedgerDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalesLedgerListModelToJson(
        SalesLedgerListModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'balance': instance.balance,
      'details': instance.details.map((e) => e.toJson()).toList(),
    };
