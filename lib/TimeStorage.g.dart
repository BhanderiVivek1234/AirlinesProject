// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimeStorage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeStorageAdapter extends TypeAdapter<TimeStorage> {
  @override
  final int typeId = 1;

  @override
  TimeStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeStorage(
      fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TimeStorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
