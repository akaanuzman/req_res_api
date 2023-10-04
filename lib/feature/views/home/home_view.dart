import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../service/index.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            LocaleStorageService().delete(LocaleStorageKeys.token.name);
          },
          child: Text("Clear Cache"),
        ),
      ),
    );
  }
}
