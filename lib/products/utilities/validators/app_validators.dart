import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/index.dart';

/// This class is used to validate text fields
/// [AppValidators] is a class that contains static methods
/// [AppValidators] is immutable
@immutable
final class AppValidators {
  const AppValidators._();

  /// This method is used to validate email
  /// [value] is the value of the text fields
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.emailCannotBeEmpty;
    } else if (!value.ext.isValidEmail) {
      return StringConstants.emailMustBeValid;
    } else {
      return null;
    }
  }

  /// This method is used to validate password
  /// [value] is the value of the text fields
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.passwordCannotBeEmpty;
    } else if (value.ext.isValidPassword) {
      return StringConstants.passwordMustBeValid;
    } else {
      return null;
    }
  }

  /// This method is used to validate confirm password
  /// [password] is the value of the password text fields
  /// [confrimPassword] is the value of the confrim password text field
  static String? confrimPasswordValidator(
      String? password, String? confirmPassword) {
    if (password == null || password.isEmpty) {
      return StringConstants.passwordCannotBeEmpty;
    } else if (password != confirmPassword) {
      return StringConstants.passwordDoesNotMatch;
    } else if (password.ext.isValidPassword &&
        confirmPassword.ext.isValidPassword) {
      return StringConstants.passwordMustBeValid;
    }
    return null;
  }
}
