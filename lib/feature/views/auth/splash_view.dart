// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../../products/constants/index.dart';
import '../../../products/generation/index.dart';
import '../../service/local_storage_service.dart';
import '../index.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  Future<void> readLocalStorage(BuildContext context) async {
    String? token =
        await LocaleStorageService().read(LocaleStorageKeys.token.name);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => token == null ? const LoginView() : const HomeView(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readLocalStorage(context),
        builder: (context, snapshot) {
          return const Center(
            child: _ImageAndTitle(),
          );
        },
      ),
    );
  }
}

class _ImageAndTitle extends StatelessWidget {
  const _ImageAndTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lottie Image
        AspectRatio(
          aspectRatio: AspectRatioConstants.medium.value,
          child: Lottie.asset(Assets.lotties.imgSplash),
        ),

        context.sized.emptySizedHeightBoxLow3x,

        // Welcome Text
        Text(
          StringConstants.welcome,
          style: context.general.textTheme.headlineLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
