import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import '../../../products/constants/index.dart';

import '../../../products/generation/index.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _ImageAndTitle(),
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