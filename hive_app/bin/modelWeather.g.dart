// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelWeather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 1;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      title: fields[1] as String?,
      day: fields[0] as int?,
      tempDay: fields[2] as String?,
      tempNight: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.tempDay)
      ..writeByte(3)
      ..write(obj.tempNight)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(0)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
