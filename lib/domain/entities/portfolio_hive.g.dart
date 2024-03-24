// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PortfolioHiveAdapter extends TypeAdapter<PortfolioHive> {
  @override
  final int typeId = 1;

  @override
  PortfolioHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PortfolioHive()..cryptoData = (fields[0] as List).cast<Coin>();
  }

  @override
  void write(BinaryWriter writer, PortfolioHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cryptoData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortfolioHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
