import 'package:dio/dio.dart';
import 'abstract_coins_repository.dart';
import 'models/crypto_model.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,NOT,SOL&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map(
      (entry) {
        final usdData = entry.value['USD'] as Map<String, dynamic>;
        final priceInUSD = usdData['PRICE'] as double;
        final imageURL = usdData['IMAGEURL'] as String;
        return CryptoCoin(
          name: entry.key,
          priceInUSD: priceInUSD,
          imageURL: 'https://www.cryptocompare.com/$imageURL',
        );
      },
    ).toList();
    print(cryptoCoinsList);
    return cryptoCoinsList;
  }
}
