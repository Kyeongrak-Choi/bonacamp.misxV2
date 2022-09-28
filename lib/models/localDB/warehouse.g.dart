// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WarehouseModelAdapter extends TypeAdapter<WarehouseModel> {
  @override
  final int typeId = 5;

  @override
  WarehouseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WarehouseModel(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WarehouseModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.WH_CD)
      ..writeByte(1)
      ..write(obj.WH_NM);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WarehouseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) =>
    WarehouseModel(
      json['WH_CD'] as String,
      json['WH_NM'] as String,
    );

Map<String, dynamic> _$WarehouseModelToJson(WarehouseModel instance) =>
    <String, dynamic>{
      'WH_CD': instance.WH_CD,
      'WH_NM': instance.WH_NM,
    };
