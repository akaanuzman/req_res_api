import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import '../../../products/utilities/validators/app_validators.dart';

import '../../../products/constants/index.dart';
import '../../../products/generation/index.dart';
import '../../../products/widgets/text_fields/special_text_from_field.dart';
import 'mixin/login_mixin.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    var read = ref.read(authController);
    var watch = ref.watch(authController);
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: context.padding.normal,
          children: [
            // Login Image
            Lottie.asset(Assets.lotties.imgLogin),

            context.sized.emptySizedHeightBoxLow,

            // Others
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Email Field
                  SpecialTextFormField(
                    textEditingController: emailController,
                    labelText: StringConstants.emailLabel,
                    hintText: StringConstants.emailHint,
                    prefixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: AppValidators.emailValidator,
                  ),

                  context.sized.emptySizedHeightBoxLow3x,

                  // Password Field
                  SpecialTextFormField(
                    textEditingController: passwordController,
                    labelText: StringConstants.passwordLabel,
                    hintText: StringConstants.passwordHint,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => read.togglePasswordVisibility(),
                      icon: Icon(
                        watch.isHidePassword
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: watch.isHidePassword,
                    validator: AppValidators.passwordValidator,
                  ),

                  context.sized.emptySizedHeightBoxLow3x,

                  // Login Button
                  SizedBox(
                    height: ButtonSizeConstants.normal.value,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async => await login(),
                      icon: const Icon(Icons.login),
                      label: const Text(StringConstants.login),
                    ),
                  ),

                  context.sized.emptySizedHeightBoxLow3x,

                  // Sign Up Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(StringConstants.signUpDesc),
                      TextButton(
                        onPressed: () => goRegsiter(),
                        child: const Text(StringConstants.signUp),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
