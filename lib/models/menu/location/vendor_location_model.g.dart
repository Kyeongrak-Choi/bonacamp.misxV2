// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorLocationModel _$VendorLocationModelFromJson(
        Map<String, dynamic> json) =>
    VendorLocationModel(
      json['code'],
      json['name'],
      json['representative'],
      VendorLocationListModel.fromJson(json['location'] as Map<String, dynamic>),
      json['sales-rep-code'],
      json['sales-rep'],
      json['status-code'],
      json['status'],
      json['business-no'],
      json['sales-date'],
      json['amount'],
      json['monthly-amount'],
      json['deposit'],
      json['remain-deposit'],
      json['rent-amount'],
      json['rent-balance'],
      json['balance'],
      json['visit-count'],
      json['margin-rate'],
    );

Map<String, dynamic> _$VendorLocationModelToJson(
    VendorLocationModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'representative': instance.representative,
      'location': instance.location.toJson(),
      'sales-rep-code': instance.salesRepCode,
      'sales-rep': instance.salesRep,
      'status-code': instance.statusCode,
      'status': instance.status,
      'business-no': instance.businessNo,
      'sales-date': instance.salesDate,
      'amount': instance.amount,
      'monthly-amount': instance.monthlyAmount,
      'deposit': instance.deposit,
      'remain-deposit': instance.remainDeposit,
      'rent-amount': instance.rentAmount,
      'rent-balance': instance.rentBalance,
      'balance': instance.balance,
      'visit-count': instance.visitCount,
      'margin-rate': instance.marginRate,
    };
