// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallsales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllSalesModel _$OverAllSalesModelFromJson(Map<String, dynamic> json) =>
    OverAllSalesModel(
      json['rental-balance'] as String?,
      json['supplement-amount'] as String?,
      json['vat-amount'] as String?,
      json['guarantee-amount'] as String?,
    );

Map<String, dynamic> _$OverAllSalesModelToJson(OverAllSalesModel instance) =>
    <String, dynamic>{
      'rental-balance': instance.totAmt,
      'supplement-amount': instance.suppAmt,
      'vat-amount': instance.vatAmt,
      'guarantee-amount': instance.grntAmt,
    };
