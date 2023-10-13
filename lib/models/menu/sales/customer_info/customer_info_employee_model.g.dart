// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_info_employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerInfoEmployeeModel _$CustomerInfoEmployeeModelFromJson(
        Map<String, dynamic> json) =>
    CustomerInfoEmployeeModel(
      json['sales-rep'] as String?,
      json['manager'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$CustomerInfoEmployeeModelToJson(
        CustomerInfoEmployeeModel instance) =>
    <String, dynamic>{
      'sales-rep': instance.salesRep,
      'manager': instance.manager,
      'email': instance.email,
    };
