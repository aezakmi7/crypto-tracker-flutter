import 'package:flutter/material.dart';

class CryptoDetailsScreen extends StatefulWidget {
  const CryptoDetailsScreen({super.key});

  @override
  State<CryptoDetailsScreen> createState() => _CryptoDetailsScreenState();
}

class _CryptoDetailsScreenState extends State<CryptoDetailsScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'Invalid arguments');
    if (args == null) {
      print('No arguments');
      return;
    }
    if (args is! String) {
      print('Invalid arguments');
      return;
    }
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$coinName',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
