// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_ledger_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseLedgerListModel _$PurchaseLedgerListModelFromJson(
        Map<String, dynamic> json) =>
    PurchaseLedgerListModel(
      json['date'],
      json['balance'],
      (json['details'] as List<dynamic>)
          .map((e) =>
              PurchaseLedgerDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseLedgerListModelToJson(
        PurchaseLedgerListModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'balance': instance.balance,
      'details': instance.details.map((e) => e.toJson()).toList(),
    };
