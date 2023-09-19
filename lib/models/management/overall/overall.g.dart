// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverAllModel _$OverAllModelFromJson(Map<String, dynamic> json) => OverAllModel(
      OverAllSalesModel.fromJson(json['overAllSales'] as Map<String, dynamic>),
      OverAllPurchaseModel.fromJson(json['overAllPurchase'] as Map<String, dynamic>),
      OverAllDepositModel.fromJson(json['overAllDeposit'] as Map<String, dynamic>),
      OverAllWithdrawModel.fromJson(json['overAllWithdraw'] as Map<String, dynamic>),
      OverAllReturnModel.fromJson(json['overAllReturn'] as Map<String, dynamic>),
      OverAllRentalModel.fromJson(json['overAllRental'] as Map<String, dynamic>),
      OverAllAssetModel.fromJson(json['overAllAsset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OverAllModelToJson(OverAllModel instance) => <String, dynamic>{
      'overAllSales': instance.overAllSales.toJson(),
      'overAllPurchase': instance.overAllPurchase.toJson(),
      'overAllDeposit': instance.overAllDeposit.toJson(),
      'overAllWithdraw': instance.overAllWithdraw.toJson(),
      'overAllReturn': instance.overAllReturn.toJson(),
      'overAllRental': instance.overAllRental.toJson(),
      'overAllAsset': instance.overAllAsset.toJson(),
    };
