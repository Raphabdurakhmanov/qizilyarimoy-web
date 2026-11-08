import 'dart:convert';

import 'package:app/features/auth/data/model/user_collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Simple key-value storage that works on Android, iOS and Web
/// (replaces the previous Isar database).
class LocalStorage {
  LocalStorage(this.prefs);

  final SharedPreferences prefs;

  static const String _userKey = 'cached_user';

  static Future<LocalStorage> create() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalStorage(prefs);
  }

  Future<void> saveUser(UserCollection user) async {
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  UserCollection? getUser() {
    final raw = prefs.getString(_userKey);
    if (raw == null || raw.isEmpty) return null;
    try {
      return UserCollection.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearUser() async {
    await prefs.remove(_userKey);
  }
}
