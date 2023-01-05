// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Airlines.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AirlinesAdapter extends TypeAdapter<Airlines> {
  @override
  final int typeId = 0;

  @override
  Airlines read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Airlines(
      name: fields[0] as String?,
      country: fields[1] as String?,
      logo: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Airlines obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AirlinesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
