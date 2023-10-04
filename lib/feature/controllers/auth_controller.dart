import 'package:flutter/material.dart';

import '../../products/constants/index.dart';
import '../models/register_model.dart';
import '../service/index.dart';

final class AuthController with ChangeNotifier {
  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  bool _isHideConfrimPassword = true;
  bool get isHideConfrimPassword => _isHideConfrimPassword;

  RegisterResponseModel _registerResponseModel = const RegisterResponseModel();

  RegisterResponseModel get registerResponseModel => _registerResponseModel;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void togglePasswordVisibility() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  void toggleConfrimPasswordVisibility() {
    _isHideConfrimPassword = !_isHideConfrimPassword;
    notifyListeners();
  }

  /// [register] is a method for register user.
  /// [email] is required.
  /// [password] is required.
  /// [return] is a error message nullable.
  Future<String?> authentication({
    required String email,
    required String password,
    bool isRegister = false,
  }) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    final String url = isRegister
        ? "${AppConstants.baseUrl}${Endpoint.register.name}"
        : "${AppConstants.baseUrl}${Endpoint.register.name}";

    (RegisterResponseModel, String?) response =
        await ApiService.post<RegisterResponseModel>(
      url: url,
      model: _registerResponseModel,
      body: body,
    );

    _registerResponseModel = response.$1;
    _errorMessage = response.$2;

    await _saveTokenToLocale();

    notifyListeners();

    if (_errorMessage == null) return null;
    return _errorMessage;
  }

  Future<void> _saveTokenToLocale() async {
    if (_registerResponseModel.token == null) return;
    await LocaleStorageService().write<String>(
      key: LocaleStorageKeys.token.name,
      value: _registerResponseModel.token!,
    );
  }

  void onDispose() {
    _isHidePassword = true;
    _isHideConfrimPassword = true;
    _registerResponseModel = const RegisterResponseModel();
    _errorMessage = null;
    notifyListeners();
  }
}
