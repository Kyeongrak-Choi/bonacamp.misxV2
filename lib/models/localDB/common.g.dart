// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommonModelAdapter extends TypeAdapter<CommonModel> {
  @override
  final int typeId = 6;

  @override
  CommonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommonModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CommonModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.MAIN_CD)
      ..writeByte(1)
      ..write(obj.SUB_CD)
      ..writeByte(2)
      ..write(obj.SUB_NM);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CommonModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonModel _$CommonModelFromJson(Map<String, dynamic> json) => CommonModel(
      json['MAIN_CD'] as String,
      json['SUB_CD'] as String,
      json['SUB_NM'] as String,
    );

Map<String, dynamic> _$CommonModelToJson(CommonModel instance) => <String, dynamic>{
      'MAIN_CD': instance.MAIN_CD,
      'SUB_CD': instance.SUB_CD,
      'SUB_NM': instance.SUB_NM,
    };
