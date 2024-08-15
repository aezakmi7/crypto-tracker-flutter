import 'package:crypto_tracker_flutter/repositories/crypto_coins/models/crypto_detail.dart';
import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.detail,
  });

  final String name;
  final CryptoDetail detail;

  @override
  List<Object?> get props => [name, detail];
}
