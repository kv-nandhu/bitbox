// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/user_favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddfavoriteAdapter extends TypeAdapter<Addfavorite> {
  @override
  final int typeId = 3;

  @override
  Addfavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addfavorite(
      name: fields[0] as String?,
      prize: fields[1] as String?,
      image: fields[2] as String?,
      about: fields[3] as String?,
      category: fields[4] as String?,
      id: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Addfavorite obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.prize)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.about)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddfavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
