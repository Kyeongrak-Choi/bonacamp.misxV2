// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salchrg.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalChrgModelAdapter extends TypeAdapter<SalChrgModel> {
  @override
  final int typeId = 2;

  @override
  SalChrgModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalChrgModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SalChrgModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._salChrgCd)
      ..writeByte(1)
      ..write(obj._salChrgNm)
      ..writeByte(2)
      ..write(obj._mgmtChrgrYn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalChrgModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}