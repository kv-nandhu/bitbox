// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/user_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddproductsAdapter extends TypeAdapter<Addproducts> {
  @override
  final int typeId = 2;

  @override
  Addproducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addproducts(
      name: fields[0] as String?,
      prize: fields[1] as String?,
      image: fields[2] as String?,
      about: fields[3] as String?,
      category: fields[4] as String?,
      unit: fields[5] as String?,
      id: fields[6] as int?, 
    );
  }

  @override
  void write(BinaryWriter writer, Addproducts obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.prize)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.about)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddproductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
