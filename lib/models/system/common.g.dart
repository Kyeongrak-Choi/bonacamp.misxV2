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
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CommonModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.mainCd)
      ..writeByte(1)
      ..write(obj.subCd)
      ..writeByte(2)
      ..write(obj.subNm)
      ..writeByte(3)
      ..write(obj.conn1)
      ..writeByte(4)
      ..write(obj.conn2)
      ..writeByte(5)
      ..write(obj.conn3)
      ..writeByte(6)
      ..write(obj.conn4)
      ..writeByte(7)
      ..write(obj.conn5)
      ..writeByte(8)
      ..write(obj.inqOrd);
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
      json['mainCd'] as String,
      json['subCd'] as String,
      json['subNm'] as String,
      json['conn1'] as String,
      json['conn2'] as String,
      json['conn3'] as String,
      json['conn4'] as String,
      json['conn5'] as String,
      json['inqOrd'] as String,
    );

Map<String, dynamic> _$CommonModelToJson(CommonModel instance) => <String, dynamic>{
      'mainCd': instance.mainCd,
      'subCd': instance.subCd,
      'subNm': instance.subNm,
      'conn1': instance.conn1,
      'conn2': instance.conn2,
      'conn3': instance.conn3,
      'conn4': instance.conn4,
      'conn5': instance.conn5,
      'inqOrd': instance.inqOrd,
    };
