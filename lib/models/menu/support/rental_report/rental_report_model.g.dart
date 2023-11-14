// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentalReportModel _$RentalReportModelFromJson(Map<String, dynamic> json) => RentalReportModel(
      json['code'],
      json['name'],
      (json['list'] as List<dynamic>).map((e) => RentalReportDetailsModel.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$RentalReportModelToJson(RentalReportModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'list': instance.detailList.map((e) => e.toJson()).toList(),
    };
