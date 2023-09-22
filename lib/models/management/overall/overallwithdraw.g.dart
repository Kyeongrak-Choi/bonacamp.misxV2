// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallwithdraw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllWithdrawModel _$OverAllWithdrawModelFromJson(Map<String, dynamic> json) => OverAllWithdrawModel(
      json['withdraw-amount'] as String?,
      json['finance-balance'] as String?,
    );

Map<String, dynamic> _$OverAllWithdrawModelToJson(OverAllWithdrawModel instance) => <String, dynamic>{
      'withdraw-amount': instance.outTot,
      'finance-balance': instance.amt,
    };
