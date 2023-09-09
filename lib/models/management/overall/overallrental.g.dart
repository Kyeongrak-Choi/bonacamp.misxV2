// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallrental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllRentalModel _$OverAllRentalModelFromJson(Map<String, dynamic> json) =>
    OverAllRentalModel(
      json['lendAmt'] as String?,
      json['inspayLendAmt'] as String?,
      json['retrvAmt'] as String?,
      json['remAmt'] as String?,
      json['totAmt'] as String?,
    );

Map<String, dynamic> _$OverAllRentalModelToJson(OverAllRentalModel instance) =>
    <String, dynamic>{
      'lendAmt': instance.lendAmt,
      'inspayLendAmt': instance.inspayLendAmt,
      'retrvAmt': instance.retrvAmt,
      'remAmt': instance.remAmt,
      'totAmt': instance.totAmt,
    };
