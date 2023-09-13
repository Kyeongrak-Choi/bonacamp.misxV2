// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallsales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllSalesModel _$OverAllSalesModelFromJson(Map<String, dynamic> json) => OverAllSalesModel(
      json['totAmt'] as String?,
      json['suppAmt'] as String?,
      json['vatAmt'] as String?,
      json['grntAmt'] as String?,
    );

Map<String, dynamic> _$OverAllSalesModelToJson(OverAllSalesModel instance) => <String, dynamic>{
      'totAmt': instance.totAmt,
      'suppAmt': instance.suppAmt,
      'vatAmt': instance.vatAmt,
      'grntAmt': instance.grntAmt,
    };
