import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

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
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
        itemBuilder: (context, index) {
          const coinName = 'Bitcoin';
          return const CryptoCoinTile(coinName: coinName);
        },
      ),
    );
  }
}
