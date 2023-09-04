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
      ..write(obj.nodeCd)
      ..writeByte(1)
      ..write(obj.comNm)
      ..writeByte(2)
      ..write(obj.braNm)
      ..writeByte(3)
      ..write(obj.reprNm)
      ..writeByte(4)
      ..write(obj.bizrRegNo);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeModel _$NodeModelFromJson(Map<String, dynamic> json) => NodeModel(
      json['nodeCd'] as String,
      json['comNm'] as String,
      json['braNm'] as String,
      json['reprNm'] as String,
      json['bizrRegNo'] as String,
    );

Map<String, dynamic> _$NodeModelToJson(NodeModel instance) => <String, dynamic>{
      'nodeCd': instance.nodeCd,
      'comNm': instance.comNm,
      'braNm': instance.braNm,
      'reprNm': instance.reprNm,
      'bizrRegNo': instance.bizrRegNo,
    };
