// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overallrental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllRentalModel _$OverAllRentalModelFromJson(Map<String, dynamic> json) => OverAllRentalModel(
      json['amount'] as dynamic,
      json['collect'] as dynamic,
      json['collect-target'] as dynamic,
      json['collect-balance'] as dynamic,
      json['balance'] as dynamic,
    );

Map<String, dynamic> _$OverAllRentalModelToJson(OverAllRentalModel instance) => <String, dynamic>{
      'amount': instance.lendAmt,
      'collect': instance.inspayLendAmt,
      'collect-target': instance.retrvAmt,
      'collect-balance': instance.remAmt,
      'balance': instance.totAmt,
    };
