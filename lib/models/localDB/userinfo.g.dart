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
      ..write(obj.clientCd)
      ..writeByte(1)
      ..write(obj.clientNm)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.userNm)
      ..writeByte(4)
      ..write(obj.businessNo)
      ..writeByte(5)
      ..write(obj.systemCd)
      ..writeByte(6)
      ..write(obj.dbUid);
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
      json['clientCd'] as String,
      json['clientNm'] as String,
      json['userId'] as String,
      json['userNm'] as String,
      json['businessNo'] as String,
      json['systemCd'] as String,
      json['dbUid'] as String,
    );

Map<String, dynamic> _$UserinfoModelToJson(UserinfoModel instance) =>
    <String, dynamic>{
      'clientCd': instance.clientCd,
      'clientNm': instance.clientNm,
      'userId': instance.userId,
      'userNm': instance.userNm,
      'businessNo': instance.businessNo,
      'systemCd': instance.systemCd,
      'dbUid': instance.dbUid,
    };
