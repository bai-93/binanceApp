// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesHiveAdapter extends TypeAdapter<FavoritesHive> {
  @override
  final int typeId = 2;

  @override
  FavoritesHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesHive(
      name: fields[0] as String?,
      volume24h: fields[1] as double?,
      topPrice: fields[2] as double?,
      lowPrice: fields[3] as double?,
      lastPrice: fields[4] as double?,
      percent24h: fields[5] as double?,
      symbol: fields[6] as String?,
      id: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoritesHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.volume24h)
      ..writeByte(2)
      ..write(obj.topPrice)
      ..writeByte(3)
      ..write(obj.lowPrice)
      ..writeByte(4)
      ..write(obj.lastPrice)
      ..writeByte(5)
      ..write(obj.percent24h)
      ..writeByte(6)
      ..write(obj.symbol)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
