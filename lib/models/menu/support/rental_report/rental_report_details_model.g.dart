// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_report_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentalReportDetailsModel _$RentalReportDetailsModelFromJson(
        Map<String, dynamic> json) =>
    RentalReportDetailsModel(
      json['sequence'],
      json['status'],
      json['divide-month'],
      json['interest-rate'],
      json['pay-last-date'],
      json['total-rental-amount'],
      json['total-return-amount'],
      json['balance'],
      json['sales-rep-code'],
      json['sales-rep-name'],
      json['rental-amount'],
      json['return-amount'],
      json['overdue-amount'],
    );

Map<String, dynamic> _$RentalReportDetailsModelToJson(
    RentalReportDetailsModel instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'status': instance.status,
      'divide-month': instance.divideMonth,
      'interest-rate': instance.interestRate,
      'pay-last-date': instance.payLastDate,
      'total-rental-amount': instance.totalRentalAmount,
      'total-return-amount': instance.totalReturnAmount,
      'balance': instance.balance,
      'sales-rep-code': instance.salesRepCode,
      'sales-rep-name': instance.salesRepName,
      'rental-amount': instance.rentalAmount,
      'return-amount': instance.returnAmount,
      'overdue-amount': instance.overdueAmount,
    };
