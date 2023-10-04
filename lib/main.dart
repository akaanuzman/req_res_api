import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feature/views/index.dart';
import 'products/constants/index.dart';
import 'products/utilities/theme/app_theme.dart';

void main() => runApp(
      const ProviderScope(child: MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: AppConstants.isShowDebugBanner,
      title: AppConstants.appName,
      theme: AppTheme().currentTheme,
      home: const SplashView(),
    );
  }
}
