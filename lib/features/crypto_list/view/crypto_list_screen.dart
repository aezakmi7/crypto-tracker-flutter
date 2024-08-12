import 'package:crypto_tracker_flutter/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_tracker_flutter/repositories/crypto_coins/models/crypto_model.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'lib/assets/logo_icon.png',
          ),
        ),
        title: Text(
          'Title',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: _cryptoCoinsList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _cryptoCoinsList!.length,
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];

                return CryptoCoinTile(coin: coin);
              },
            ),
    );
  }

  Future<void> loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}
