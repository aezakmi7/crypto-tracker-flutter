import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_detail.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoDetail extends Equatable {
  const CryptoDetail({
    required this.priceInUSD,
    required this.imageURL,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  @HiveField(0)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @HiveField(1)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @HiveField(2)
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @HiveField(4)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(5)
  @JsonKey(name: 'IMAGEURL')
  final String imageURL;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageURL';

  factory CryptoDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoDetailFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoDetailToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object?> get props => [
        toSymbol,
        lastUpdate,
        hight24Hour,
        low24Hours,
        priceInUSD,
        imageURL,
      ];
}
