// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CancelorderAdapter extends TypeAdapter<Cancelorder> {
  @override
  final int typeId = 11;

  @override
  Cancelorder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cancelorder(
      name: fields[1] as String,
      price: fields[2] as String,
      about: fields[3] as String,
      image: fields[4] as String,
      deliveryAddress: fields[5] as String,
      deliveryName: fields[6] as String,
      deliveryPhone: fields[7] as String,
      pincode: fields[9] as String,
      productCount: fields[10] as String,
      id: fields[0] as int?,
      deliveryCity: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cancelorder obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.about)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.deliveryAddress)
      ..writeByte(6)
      ..write(obj.deliveryName)
      ..writeByte(7)
      ..write(obj.deliveryPhone)
      ..writeByte(8)
      ..write(obj.deliveryCity)
      ..writeByte(9)
      ..write(obj.pincode)
      ..writeByte(10)
      ..write(obj.productCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CancelorderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
