// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NodeModelAdapter extends TypeAdapter<NodeModel> {
  @override
  final int typeId = 3;

  @override
  NodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NodeModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NodeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._nodeCode)
      ..writeByte(1)
      ..write(obj._comNm)
      ..writeByte(2)
      ..write(obj._braNm)
      ..writeByte(3)
      ..write(obj._reprNm)
      ..writeByte(4)
      ..write(obj._bizrRegNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
