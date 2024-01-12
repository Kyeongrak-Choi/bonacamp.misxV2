// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overalldeposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllDepositModel _$OverAllDepositModelFromJson(Map<String, dynamic> json) =>
    OverAllDepositModel(
      json['collect'] as dynamic,
      json['amount'] as dynamic,
      json['balance'] as dynamic,
    );

Map<String, dynamic> _$OverAllDepositModelToJson(
        OverAllDepositModel instance) =>
    <String, dynamic>{
      'collect': instance.retrvAmt,
      'amount': instance.ipTot,
      'balance': instance.amt,
    };
