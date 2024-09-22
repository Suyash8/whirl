import 'package:hive_flutter/adapters.dart';

class LocalDataController {
  final box = Hive.box('local_auth_data');

  Future<dynamic> fetch(String key) async {
    return box.get(key);
  }

  Future<void> set(String key, Object value) async {
    return box.put(key, value);
  }

  Future<void> delete(String key) async {
    return box.delete(key);
  }

  Future<int> clear() async {
    return box.clear();
  }

  Future<Map<String, String?>> fetchCredentials() async {
    final String? email = await fetch('email');
    final String? password = await fetch('password');
    return {'email': email, 'password': password};
  }

}