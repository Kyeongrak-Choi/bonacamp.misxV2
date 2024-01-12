// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_info_sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerInfoSalesModel _$CustomerInfoSalesModelFromJson(
        Map<String, dynamic> json) =>
    CustomerInfoSalesModel(
      json['title'] as String?,
      json['month'] as String?,
      json['sales-amount'] as int,
      json['balance'] as int,
    );

Map<String, dynamic> _$CustomerInfoSalesModelToJson(
        CustomerInfoSalesModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'month': instance.month,
      'sales-amount': instance.salesAmount,
      'balance': instance.balance,
    };
