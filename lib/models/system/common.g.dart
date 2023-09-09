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
      fields[0] as String?,
      fields[1] as int?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CommonModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.mainCode)
      ..writeByte(1)
      ..write(obj.no)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.option1)
      ..writeByte(5)
      ..write(obj.option2)
      ..writeByte(6)
      ..write(obj.option3)
      ..writeByte(7)
      ..write(obj.option4)
      ..writeByte(8)
      ..write(obj.option5);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonModel _$CommonModelFromJson(Map<String, dynamic> json) => CommonModel(
      json['mainCode'] as String?,
      json['no'] as int?,
      json['code'] as String?,
      json['name'] as String?,
      json['option1'] as String?,
      json['option2'] as String?,
      json['option3'] as String?,
      json['option4'] as String?,
      json['option5'] as String?,
    );

Map<String, dynamic> _$CommonModelToJson(CommonModel instance) =>
    <String, dynamic>{
      'mainCode': instance.mainCode,
      'no': instance.no,
      'code': instance.code,
      'name': instance.name,
      'option1': instance.option1,
      'option2': instance.option2,
      'option3': instance.option3,
      'option4': instance.option4,
      'option5': instance.option5,
    };
