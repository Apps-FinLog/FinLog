// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillDataAdapter extends TypeAdapter<BillData> {
  @override
  final typeId = 1;

  @override
  BillData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BillData()
      ..displayDate = fields[0] as String
      ..displayTime = fields[1] as String
      ..billItems = (fields[2] as List).cast<BillItem>()
      ..subtotal = (fields[3] as num).toDouble()
      ..pajak = (fields[4] as num).toDouble()
      ..diskon = (fields[5] as num).toDouble()
      ..lainnya = (fields[6] as num).toDouble()
      ..jumlahTotal = (fields[7] as num).toDouble();
  }

  @override
  void write(BinaryWriter writer, BillData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.displayDate)
      ..writeByte(1)
      ..write(obj.displayTime)
      ..writeByte(2)
      ..write(obj.billItems)
      ..writeByte(3)
      ..write(obj.subtotal)
      ..writeByte(4)
      ..write(obj.pajak)
      ..writeByte(5)
      ..write(obj.diskon)
      ..writeByte(6)
      ..write(obj.lainnya)
      ..writeByte(7)
      ..write(obj.jumlahTotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
