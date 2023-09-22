// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overalldeposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllDepositModel _$OverAllDepositModelFromJson(Map<String, dynamic> json) =>
    OverAllDepositModel(
      json['recall-amount'] as String?,
      json['deposit-amount'] as String?,
      json['bond-balance'] as String?,
    );

Map<String, dynamic> _$OverAllDepositModelToJson(
        OverAllDepositModel instance) =>
    <String, dynamic>{
      'recall-amount': instance.retrvAmt,
      'deposit-amount': instance.ipTot,
      'bond-balance': instance.amt,
    };
