// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllModel _$OverAllModelFromJson(Map<String, dynamic> json) => OverAllModel(
      OverAllSalesModel.fromJson(json['sales'] as Map<String, dynamic>),
      OverAllPurchaseModel.fromJson(json['purchase'] as Map<String, dynamic>),
      OverAllDepositModel.fromJson(json['deposit'] as Map<String, dynamic>),
      OverAllWithdrawModel.fromJson(json['withdraw'] as Map<String, dynamic>),
      OverAllReturnModel.fromJson(json['rental'] as Map<String, dynamic>),
      OverAllRentalModel.fromJson(json['return'] as Map<String, dynamic>),
      OverAllAssetModel.fromJson(json['asset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OverAllModelToJson(OverAllModel instance) =>
    <String, dynamic>{
      'sales': instance.overAllSales.toJson(),
      'purchase': instance.overAllPurchase.toJson(),
      'deposit': instance.overAllDeposit.toJson(),
      'withdraw': instance.overAllWithdraw.toJson(),
      'rental': instance.overAllReturn.toJson(),
      'return': instance.overAllRental.toJson(),
      'asset': instance.overAllAsset.toJson(),
    };
