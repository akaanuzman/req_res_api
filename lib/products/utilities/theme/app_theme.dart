import 'package:flutter/material.dart';

import '../../generation/index.dart';

@immutable
final class AppTheme {
  late final ThemeData _themeData;

  AppTheme() {
    _themeData = ThemeData.light();
  }

  ThemeData get currentTheme => _themeData.copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorName.purplePristine,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.purplePristine,
            foregroundColor: ColorName.placeboPurple,
          )
        )
      );
}
