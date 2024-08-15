import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'abstract_coins_repository.dart';
import 'models/crypto_detail.dart';
import 'models/crypto_model.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
    required this.cryptoCoinsBox,
  });

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,NOT,SOL&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((entry) {
      final usdData =
          (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;

      final detail = CryptoDetail.fromJson(usdData);

      return CryptoCoin(
        name: entry.key,
        detail: detail,
      );
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final detail = CryptoDetail.fromJson(usdData);

    return CryptoCoin(
      name: currencyCode,
      detail: detail,
    );
  }
}
