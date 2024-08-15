// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoDetailAdapter extends TypeAdapter<CryptoDetail> {
  @override
  final int typeId = 1;

  @override
  CryptoDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoDetail(
      priceInUSD: fields[4] as double,
      imageURL: fields[5] as String,
      toSymbol: fields[0] as String,
      lastUpdate: fields[1] as DateTime,
      hight24Hour: fields[2] as double,
      low24Hours: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.toSymbol)
      ..writeByte(1)
      ..write(obj.lastUpdate)
      ..writeByte(2)
      ..write(obj.hight24Hour)
      ..writeByte(3)
      ..write(obj.low24Hours)
      ..writeByte(4)
      ..write(obj.priceInUSD)
      ..writeByte(5)
      ..write(obj.imageURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoDetail _$CryptoDetailFromJson(Map<String, dynamic> json) => CryptoDetail(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageURL: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate:
          CryptoDetail._dateTimeFromJson((json['LASTUPDATE'] as num).toInt()),
      hight24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoDetailToJson(CryptoDetail instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': CryptoDetail._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.hight24Hour,
      'LOW24HOUR': instance.low24Hours,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageURL,
    };
