import 'package:crypto_tracker_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
          return ListTile(
            title: InkWell(
              child: Text(
                'Coin No$index',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            subtitle:
                Text('\$2000', style: Theme.of(context).textTheme.bodyMedium),
            leading: Image.asset(
              'lib/assets/bitcoin_logo.svg',
              width: 40,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
