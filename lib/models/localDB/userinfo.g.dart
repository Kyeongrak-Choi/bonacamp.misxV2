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
      ..write(obj._clientCd)
      ..writeByte(1)
      ..write(obj._clientNm)
      ..writeByte(2)
      ..write(obj._userId)
      ..writeByte(3)
      ..write(obj._userNm)
      ..writeByte(4)
      ..write(obj._businessNo)
      ..writeByte(5)
      ..write(obj._systemCd)
      ..writeByte(6)
      ..write(obj._dbUid);
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
