import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_detail.g.dart';

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

  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;

  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  @JsonKey(name: 'PRICE')
  final double priceInUSD;

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
