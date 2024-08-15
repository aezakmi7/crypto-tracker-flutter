import 'package:crypto_tracker_flutter/repositories/crypto_coins/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final coinDetail = coin.detail;
    return ListTile(
      title: Text(
        coin.name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text('\$${coinDetail.priceInUSD.toString()}',
          style: Theme.of(context).textTheme.bodyMedium),
      leading: Image.network(
        coinDetail.fullImageUrl,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigate to the detail screen
        Navigator.pushNamed(
          context,
          '/coin',
          arguments: coin,
        );
      },
    );
  }
}
