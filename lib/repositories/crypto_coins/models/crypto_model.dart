import 'package:crypto_tracker_flutter/repositories/crypto_coins/models/crypto_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_model.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.detail,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoDetail detail;

  @override
  List<Object?> get props => [name, detail];
}
