// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallrental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllRentalModel _$OverAllRentalModelFromJson(Map<String, dynamic> json) =>
    OverAllRentalModel(
          json['rental-amount'] as String?,
          json['expected-rental-amount'] as String?,
          json['recall-amount'] as String?,
          json['unrecall-amount'] as String?,
          json['rental-balance'] as String?,
    );

Map<String, dynamic> _$OverAllRentalModelToJson(OverAllRentalModel instance) =>
    <String, dynamic>{
          'rental-amount': instance.lendAmt,
          'expected-rental-amount': instance.inspayLendAmt,
          'recall-amount': instance.retrvAmt,
          'unrecall-amount': instance.remAmt,
          'rental-balance': instance.totAmt,
    };
