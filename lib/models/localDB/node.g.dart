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
      ..write(obj.NODE_CODE)
      ..writeByte(1)
      ..write(obj.COM_NM)
      ..writeByte(2)
      ..write(obj.BRA_NM)
      ..writeByte(3)
      ..write(obj.REPR_NM)
      ..writeByte(4)
      ..write(obj.BIZR_REG_NO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NodeModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeModel _$NodeModelFromJson(Map<String, dynamic> json) => NodeModel(
      json['NODE_CODE'] as String,
      json['COM_NM'] as String,
      json['BRA_NM'] as String,
      json['REPR_NM'] as String,
      json['BIZR_REG_NO'] as String,
    );

Map<String, dynamic> _$NodeModelToJson(NodeModel instance) => <String, dynamic>{
      'NODE_CODE': instance.NODE_CODE,
      'COM_NM': instance.COM_NM,
      'BRA_NM': instance.BRA_NM,
      'REPR_NM': instance.REPR_NM,
      'BIZR_REG_NO': instance.BIZR_REG_NO,
    };
