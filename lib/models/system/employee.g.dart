// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModelAdapter extends TypeAdapter<EmployeeModel> {
  @override
  final int typeId = 2;

  @override
  EmployeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModel(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.employeeCode)
      ..writeByte(1)
      ..write(obj.employeeName)
      ..writeByte(2)
      ..write(obj.manager);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is EmployeeModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) => EmployeeModel(
      json['employee-code'] as String?,
      json['employee-name'] as String?,
      json['manager'] as bool?,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) => <String, dynamic>{
      'employee-code': instance.employeeCode,
      'employee-name': instance.employeeName,
      'manager': instance.manager,
    };
