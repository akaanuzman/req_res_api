import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../../products/constants/index.dart';
import '../../../products/generation/index.dart';
import '../../../products/utilities/validators/app_validators.dart';
import '../../../products/widgets/text_fields/special_text_from_field.dart';
import 'mixin/register_mixin.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView>
    with RegisterMixin {
  @override
  Widget build(BuildContext context) {
    var read = ref.read(authController);
    var watch = ref.watch(authController);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.register),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: context.padding.normal,
          children: [
            // Register Image
            AspectRatio(
              aspectRatio: AspectRatioConstants.large.value,
              child: Lottie.asset(Assets.lotties.imgRegister),
            ),

            context.sized.emptySizedHeightBoxNormal,

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
              textInputAction: TextInputAction.next,
              obscureText: watch.isHidePassword,
              validator: AppValidators.passwordValidator,
            ),

            context.sized.emptySizedHeightBoxLow3x,

            // Confirm Password Field
            SpecialTextFormField(
              textEditingController: confirmPasswordController,
              labelText: StringConstants.confirmPasswordLabel,
              hintText: StringConstants.passwordHint,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () => read.toggleConfrimPasswordVisibility(),
                icon: Icon(
                  watch.isHideConfrimPassword
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: watch.isHideConfrimPassword,
              validator: (value) => AppValidators.confrimPasswordValidator(
                passwordController.text,
                value,
              ),
            ),

            context.sized.emptySizedHeightBoxLow3x,

            // Register Button
            SizedBox(
              height: ButtonSizeConstants.normal.value,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async => await register(),
                icon: const Icon(Icons.login),
                label: const Text(StringConstants.register),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
