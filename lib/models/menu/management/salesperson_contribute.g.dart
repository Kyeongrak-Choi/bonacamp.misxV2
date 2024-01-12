// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesperson_contribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPersonContributeModel _$SalesPersonContributeModelFromJson(
        Map<String, dynamic> json) =>
    SalesPersonContributeModel(
      json['customer-count'],
      json['sales-amount'],
      json['purchase-amount'],
      json['margin-rate'],
      json['margin'],
      json['management-cost'],
      json['finance-cost'],
      json['fix-cost'],
      json['cost-total'],
      json['balance'],
      json['rental-balance'],
      json['rental-count'],
      json['rental-quantity'],
      json['serve-rate'],
      json['expense-quantity'],
      json['serve-amount'],
      json['serve-total'],
    );

Map<String, dynamic> _$SalesPersonContributeModelToJson(
        SalesPersonContributeModel instance) =>
    <String, dynamic>{
      'customer-count': instance.customerCount,
      'sales-amount': instance.salesAmount,
      'purchase-amount': instance.purchaseAmount,
      'margin-rate': instance.marginRate,
      'margin': instance.margin,
      'management-cost': instance.managementCost,
      'finance-cost': instance.financeCost,
      'fix-cost': instance.fixCost,
      'cost-total': instance.costTotal,
      'balance': instance.balance,
      'rental-balance': instance.rentalBalance,
      'rental-count': instance.rentalCount,
      'rental-quantity': instance.rentalQuantity,
      'serve-rate': instance.serveRate,
      'expense-quantity': instance.expenseQuantity,
      'serve-amount': instance.serveAmount,
      'serve-total': instance.serveTotal,
    };
