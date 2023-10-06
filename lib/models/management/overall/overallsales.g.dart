// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallsales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllSalesModel _$OverAllSalesModelFromJson(Map<String, dynamic> json) => OverAllSalesModel(
      json['amount'] as dynamic,
      json['price'] as dynamic,
      json['vat'] as dynamic,
      json['guarantee'] as dynamic,
    );

Map<String, dynamic> _$OverAllSalesModelToJson(OverAllSalesModel instance) => <String, dynamic>{
      'amount': instance.totAmt,
      'price': instance.suppAmt,
      'vat': instance.vatAmt,
      'guarantee': instance.grntAmt,
    };
