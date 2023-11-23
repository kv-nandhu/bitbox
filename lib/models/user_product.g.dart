// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_product.dart';

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
      name: fields[0] as String,
      prize: fields[2] as String,
      image: fields[3] as String,
    )..id = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, Addproducts obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.prize)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(5)
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
