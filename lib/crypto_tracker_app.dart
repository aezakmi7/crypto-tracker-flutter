import 'package:flutter/material.dart';
import 'core/core.dart';
import 'core/routes/routes.dart';

class CryptoTrackerApp extends StatelessWidget {
  const CryptoTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
