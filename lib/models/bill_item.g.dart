// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillItemAdapter extends TypeAdapter<BillItem> {
  @override
  final typeId = 0;

  @override
  BillItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BillItem(
      name: fields[0] as String,
      price: (fields[1] as num).toDouble(),
      quantity: (fields[2] as num).toInt(),
      total: (fields[3] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, BillItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
