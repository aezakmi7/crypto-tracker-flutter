import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.amber,
  ),
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.5),
    thickness: 1.0,
  ),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
    backgroundColor: Colors.amber,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyLarge: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey.withOpacity(0.8),
    ),
  ),
);
