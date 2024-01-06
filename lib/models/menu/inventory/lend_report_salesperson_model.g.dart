// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lend_report_salesperson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendReportSalespersonModel _$LendReportSalespersonModelFromJson(
        Map<String, dynamic> json) =>
    LendReportSalespersonModel(
      json['sales-rep-code'],
      json['sales-rep'],
      (json['sales'] as List<dynamic>)
          .map((e) =>
              LendReportCustomerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LendReportSalespersonModelToJson(
        LendReportSalespersonModel instance) =>
    <String, dynamic>{
      'sales-rep-code': instance.salesRepCode,
      'sales-rep': instance.salesRep,
      'sales': instance.salespersonList.map((e) => e.toJson()).toList(),
    };
