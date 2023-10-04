// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LocaleStorageKeys { token }

/// `LocaleStorageService` class
/// This class is used to store and retrieve data from the device's local storage.
/// It uses the [FlutterSecureStorage] package.
final class LocaleStorageService {
  late final SharedPreferences _storage;

  Future<void> initStorage() async {
    _storage = await SharedPreferences.getInstance();
  }

  /// `read` method
  /// Returns a generic [value] from the storage.
  /// If the [value] is not found, returns null.
  ///
  /// Parameters:
  /// - [key] - [String] - The key of the value to be read.
  Future<T?> read<T>(String key) async {
    await initStorage();
    if (T is String) return _storage.getString(key) as T?;
    if (T is bool) return _storage.getBool(key) as T?;
    if (T is int) return _storage.getInt(key) as T?;
    if (T is double) return _storage.getDouble(key) as T?;
    if (T is List<String>) return _storage.getStringList(key) as T?;
    return _storage.get(key) as T?;
  }

  /// `write` method
  /// Writes a generic [value] to the storage.
  ///
  /// Parameters:
  /// - [key] - [String] - The key of the value to be read.
  Future<void> write<T>({
    required String key,
    required T value,
  }) async {
    await initStorage();
    if (value is String) _storage.setString(key, value);
    if (value is bool) _storage.setBool(key, value);
    if (value is int) _storage.setInt(key, value);
    if (value is double) _storage.setDouble(key, value);
    if (value is List<String>)
      _storage.setStringList(key, value);
  }

  /// `delete` method
  /// Deletes a [value] from the storage.
  ///
  /// Parameters:
  /// - [key] - [String] - The key of the value to be read.
  Future<void> delete(String key) async {
    await initStorage();
    await _storage.remove(key);
  }
}
