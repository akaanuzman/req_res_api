import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

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
      return "Email cannot be empty";
    } else if (!value.ext.isValidEmail) {
      return "Email must be valid";
    } else {
      return null;
    }
  }

  /// This method is used to validate password
  /// [value] is the value of the text fields
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.ext.isValidPassword) {
      return "Password must be valid";
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
      return "Password cannot be empty";
    } else if (password != confirmPassword) {
      return "Password does not match";
    } else if (password.ext.isValidPassword &&
        confirmPassword.ext.isValidPassword) {
      return "Passwords must be valid";
    }
    return null;
  }
}
