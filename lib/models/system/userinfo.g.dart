// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserinfoModelAdapter extends TypeAdapter<UserinfoModel> {
  @override
  final int typeId = 1;

  @override
  UserinfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserinfoModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserinfoModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.clientCode)
      ..writeByte(1)
      ..write(obj.clientName)
      ..writeByte(2)
      ..write(obj.businessNo)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.roleCode)
      ..writeByte(6)
      ..write(obj.schemaCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserinfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserinfoModel _$UserinfoModelFromJson(Map<String, dynamic> json) =>
    UserinfoModel(
      json['clientCode'] as String,
      json['clientName'] as String,
      json['businessNo'] as String,
      json['userId'] as String,
      json['userName'] as String,
      json['roleCode'] as String,
      json['schemaCode'] as String,
    );

Map<String, dynamic> _$UserinfoModelToJson(UserinfoModel instance) =>
    <String, dynamic>{
      'clientCode': instance.clientCode,
      'clientName': instance.clientName,
      'businessNo': instance.businessNo,
      'userId': instance.userId,
      'userName': instance.userName,
      'roleCode': instance.roleCode,
      'schemaCode': instance.schemaCode,
    };
