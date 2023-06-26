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
      ..write(obj.CLIENT_CODE)
      ..writeByte(1)
      ..write(obj.CLIENT_NAME)
      ..writeByte(2)
      ..write(obj.USER_ID)
      ..writeByte(3)
      ..write(obj.USER_NAME)
      ..writeByte(4)
      ..write(obj.BUSINESS_NO)
      ..writeByte(5)
      ..write(obj.SYSTEM_CD)
      ..writeByte(6)
      ..write(obj.DB_UID);
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
      json['CLIENT_CODE'] as String,
      json['CLIENT_NAME'] as String,
      json['USER_ID'] as String,
      json['USER_NAME'] as String,
      json['BUSINESS_NO'] as String,
      json['SYSTEM_CD'] as String,
      json['DB_UID'] as String,
    );

Map<String, dynamic> _$UserinfoModelToJson(UserinfoModel instance) =>
    <String, dynamic>{
      'CLIENT_CODE': instance.CLIENT_CODE,
      'CLIENT_NAME': instance.CLIENT_NAME,
      'USER_ID': instance.USER_ID,
      'USER_NAME': instance.USER_NAME,
      'BUSINESS_NO': instance.BUSINESS_NO,
      'SYSTEM_CD': instance.SYSTEM_CD,
      'DB_UID': instance.DB_UID,
    };
