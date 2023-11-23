// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lend_report_customer_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LendReportCustomerListModel _$LendReportCustomerListModelFromJson(Map<String, dynamic> json) => LendReportCustomerListModel(
      json['item-code'],
      json['item-name'],
      LendReportCustomerQuantityModel.fromJson(json['full-box'] as Map<String, dynamic>),
      LendReportCustomerQuantityModel.fromJson(json['box'] as Map<String, dynamic>),
      LendReportCustomerQuantityModel.fromJson(json['bottle'] as Map<String, dynamic>),

    );

Map<String, dynamic> _$LendReportCustomerListModelToJson(LendReportCustomerListModel instance) => <String, dynamic>{
      'item-code': instance.itemCode,
      'item-name': instance.itemName,
      'full-box': instance.fullBox.toJson(),
      'box': instance.box.toJson(),
      'bottle': instance.bottle.toJson(),
    };
