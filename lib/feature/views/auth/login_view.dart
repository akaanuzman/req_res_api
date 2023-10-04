import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'mixin/login_mixin.dart';
import '../index.dart';
import '../../../products/generation/index.dart';
import '../../../products/widgets/text_fields/special_text_from_field.dart';

import '../../../products/constants/index.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: context.padding.normal,
        children: [
          Lottie.asset(Assets.lotties.imgLogin),
          context.sized.emptySizedHeightBoxLow,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SpecialTextFormField(
                  textEditingController: emailController,
                  labelText: StringConstants.emailLabel,
                  hintText: StringConstants.emailHint,
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                context.sized.emptySizedHeightBoxLow3x,
                SpecialTextFormField(
                  textEditingController: passwordController,
                  labelText: StringConstants.passwordLabel,
                  hintText: StringConstants.passwordHint,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                context.sized.emptySizedHeightBoxLow3x,
                SizedBox(
                  height: ButtonSizeConstants.normal.value,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.login),
                    label: const Text(StringConstants.login),
                  ),
                ),
                context.sized.emptySizedHeightBoxLow3x,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(StringConstants.signUpDesc),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const RegisterView(),
                          ),
                        );
                      },
                      child: const Text(StringConstants.signUp),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
