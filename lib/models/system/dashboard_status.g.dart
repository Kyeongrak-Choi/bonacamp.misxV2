// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardStatusModel _$DashboardStatusModelFromJson(Map<String, dynamic> json) => DashboardStatusModel(
      json['sales-amount'],
      json['purchase-amount'],
      json['deposit-collect'],
      json['deposit-amount'],
      json['deposit-balance'],
    );

Map<String, dynamic> _$DashboardStatusModelToJson(DashboardStatusModel instance) => <String, dynamic>{
      'sales-amount': instance.salesAmount,
      'purchase-amount': instance.purchaseAmount,
      'deposit-collect': instance.depositCollect,
      'deposit-amount': instance.depositAmount,
      'deposit-balance': instance.depositBalance,
    };
