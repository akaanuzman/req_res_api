// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:req_res_api/feature/models/user_model.dart';

import '../../products/constants/index.dart';
import '../service/index.dart';
import '../views/index.dart';

class UserController with ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<String?> fetchUsers() async {
    _isLoading = true;
    final String url = "${AppConstants.baseUrl}${Endpoint.users.name}";

    (List<UserModel>, String?) response =
        await ApiService.fetchAllData<UserModel>(
      url: url,
      model: const UserModel(),
      key: ResponseKeys.data.name,
    );

    _users = response.$1;
    _errorMessage = response.$2;
    _isLoading = false;

    notifyListeners();

    if (_errorMessage == null) return null;
    return _errorMessage;
  }

  Future<void> logout(BuildContext context) async {
    await LocaleStorageService().delete(LocaleStorageKeys.token.name);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
      (route) => false,
    );
  }
}
