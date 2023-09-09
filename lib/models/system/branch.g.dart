// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BranchModelAdapter extends TypeAdapter<BranchModel> {
  @override
  final int typeId = 3;

  @override
  BranchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BranchModel(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BranchModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.clientCode)
      ..writeByte(1)
      ..write(obj.clientName)
      ..writeByte(2)
      ..write(obj.branchCode)
      ..writeByte(3)
      ..write(obj.branchName)
      ..writeByte(4)
      ..write(obj.businessNo)
      ..writeByte(5)
      ..write(obj.representative);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BranchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      json['clientCode'] as String?,
      json['clientName'] as String?,
      json['branchCode'] as String?,
      json['branchName'] as String?,
      json['businessNo'] as String?,
      json['representative'] as String?,
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'clientCode': instance.clientCode,
      'clientName': instance.clientName,
      'branchCode': instance.branchCode,
      'branchName': instance.branchName,
      'businessNo': instance.businessNo,
      'representative': instance.representative,
    };
