// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_detail.dart';

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
