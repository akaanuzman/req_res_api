import 'package:flutter/material.dart';

@immutable
final class StringConstants {
  const StringConstants._();

  static const String welcome = "Welcome";
  static const String ok = "Ok";
  static const String cancel = "Cancel";
  static const String yes = "Yes";
  static const String no = "No";
  static const String login = "Login";
  static const String dearUser = "Dear User";
  static const String areUSureLogout =
      "You will be logged out. Are you sure you want to continue?";
  static const String somethingWentWrong = "Something went wrong!";
  static const String signUpDesc = "Don't have an account ?";
  static const String signUp = "Sign Up";
  static const String register = "Register";
  static const String registered = "Successfully registered you will be redirected to the home screen";
  static const String users = "Users";

  // TextFields Constants
  static const String emailLabel = "Email";
  static const String emailHint = "example@example.com";
  static const String passwordLabel = "Password";
  static const String passwordHint = "******";
  static const String confirmPasswordLabel = "Confirm Password";

  // Validators Constants
  static const String emailCannotBeEmpty = "Email cannot be empty";
  static const String emailMustBeValid = "Email must be valid";
  static const String passwordCannotBeEmpty = "Password cannot be empty";
  static const String passwordMustBeValid = "Password must be valid";
  static const String passwordDoesNotMatch = "Password does not match";
}
