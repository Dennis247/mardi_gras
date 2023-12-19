import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _emailKey = 'EMAIL';
const _passwordKey = 'PASSWORD';
const _userNameKey = 'USERNAME';

class LocalStorageService {
  static const _storage = FlutterSecureStorage();

  static Future<void> storeSignInInfo({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      await Future.wait([
        _storage.write(key: _emailKey, value: email),
        _storage.write(key: _passwordKey, value: password),
        _storage.write(key: _userNameKey, value: fullName),
      ]);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<String?> getEmailFromLocalStorage() async {
    try {
      final value = await _storage.read(key: _emailKey);
      return value;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<String?> getPasswordFromLocalStorage() async {
    try {
      final value = await _storage.read(key: _passwordKey);
      return value;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<String?> getUserNameFromLocalStorage() async {
    try {
      final value = await _storage.read(key: _userNameKey);
      return value;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      log(e.toString());
    }
  }
}
