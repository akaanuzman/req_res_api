// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:req_res_api/feature/controllers/auth_controller.dart';
import 'package:req_res_api/feature/views/index.dart';
import 'package:req_res_api/products/constants/index.dart';
import 'package:req_res_api/products/widgets/alert_dialog/approve_dialog.dart';

mixin RegisterMixin on ConsumerState<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final authController = ChangeNotifierProvider((ref) => AuthController());

  Future<void> register() async {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    String? errorMessage = await ref.read(authController).authentication(
          email: emailController.text,
          password: passwordController.text,
          isRegister: true,
        );

    await ApproveDialog.show(
      context: context,
      title: StringConstants.dearUser,
      content: errorMessage ?? StringConstants.registered,
      onYesPressed: errorMessage == null ? goHome : null,
    );
  }

  void goHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
      (route) => false,
    );
  }
}
