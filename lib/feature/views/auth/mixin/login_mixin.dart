// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:req_res_api/products/constants/string_constants.dart';
import 'package:req_res_api/products/widgets/alert_dialog/approve_dialog.dart';

import '../../../controllers/auth_controller.dart';
import '../../index.dart';

mixin LoginMixin on ConsumerState<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final authController = ChangeNotifierProvider((ref) => AuthController());

  Future<void> login() async {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    String? message = await ref.read(authController).authentication(
          email: emailController.text,
          password: passwordController.text,
          isRegister: true,
        );

    if (message == null) {
      goHome();
    } else {
      await ApproveDialog.show(
        context: context,
        title: StringConstants.dearUser,
        content: message,
      );
    }
  }

  void goHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
      (route) => false,
    );
  }

  void goRegsiter() {
    ref.watch(authController).onDispose();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const RegisterView(),
      ),
    );
  }
}
