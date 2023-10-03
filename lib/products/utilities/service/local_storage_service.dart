import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum LocaleStorageKeys{ token }

/// `LocaleStorageService` class
/// This class is used to store and retrieve data from the device's local storage.
/// It uses the [FlutterSecureStorage] package.
final class LocaleStorageService {

  late final FlutterSecureStorage _storage;
  final AndroidOptions _androidOptions = const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final IOSOptions _iosOptions =
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  LocaleStorageService() {
    _storage =
        FlutterSecureStorage(iOptions: _iosOptions, aOptions: _androidOptions);
  }

  /// `read` method
  /// Returns a [String?][value] from the storage.
  /// If the [value] is not found, returns null.
  ///
  /// Parameters:
  /// - [key] - [String] - The key of the value to be read.
  Future<String?> read(String key) async => await _storage.read(key: key);

  /// `readAll` method
  /// Returns a [Map<String, dynamic>?][value] from the storage.
  /// If the [value] is not found, returns null.
  Future<Map<String, dynamic>?> readAll() async => await _storage.readAll();

  /// `write` method
  /// Writes a [String][value] to the storage.
  ///
  /// Parameters:
  /// - [key] - [String] - The key of the value to be read.
  Future<void> write({
    required String key,
    required String value,
  }) async => await _storage.write(key: key, value: value);

  /// `delete` method
  /// Deletes a [String][value] from the storage.
  ///
  /// Parameters:
  /// - [key] - [String] - The key of the value to be read.
  Future<void> delete(String key) async => await _storage.delete(key: key);

  /// `deleteAll` method
  /// Deletes all [values] from the storage.
  Future<void> deleteAll() async => await _storage.deleteAll();
}
