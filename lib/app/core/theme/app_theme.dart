import 'package:flutter/material.dart';

class Apptheme {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.greenAccent,
  );

  static ThemeData themeData = ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
  );
}
