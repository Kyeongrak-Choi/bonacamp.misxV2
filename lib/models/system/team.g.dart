// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamModelAdapter extends TypeAdapter<TeamModel> {
  @override
  final int typeId = 4;

  @override
  TeamModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamModel(
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TeamModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.teamCode)
      ..writeByte(1)
      ..write(obj.teamName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => TeamModel(
      json['teamCode'] as String?,
      json['teamName'] as String?,
    );

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'teamCode': instance.teamCode,
      'teamName': instance.teamName,
    };
