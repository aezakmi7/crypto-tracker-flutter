import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Coin Name',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text('\$2000', style: Theme.of(context).textTheme.bodyMedium),
      leading: Image.asset(
        'lib/assets/bitcoin_logo.svg',
        width: 40,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigate to the detail screen
        Navigator.pushNamed(
          context,
          '/coin',
          arguments: coinName,
        );
      },
    );
  }
}
