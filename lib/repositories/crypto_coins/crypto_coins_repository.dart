import 'package:dio/dio.dart';
import 'abstract_coins_repository.dart';
import 'models/crypto_details.dart';
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
        final priceInUSD = double.parse(usdData['PRICE'].toStringAsFixed(2));
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

  @override
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final price = double.parse(usdData['PRICE'].toStringAsFixed(2));
    final hight24Hour = double.parse(usdData['HIGH24HOUR'].toStringAsFixed(2));
    final low24Hours = double.parse(usdData['LOW24HOUR'].toStringAsFixed(2));
    final imageUrl = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = usdData['LASTUPDATE'];

    return CryptoCoinDetail(
      name: currencyCode,
      priceInUSD: price,
      imageURL: 'https://www.cryptocompare.com/$imageUrl',
      toSymbol: toSymbol,
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
      hight24Hour: hight24Hour,
      low24Hours: low24Hours,
    );
  }
}
