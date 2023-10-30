import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_notifier.g.dart';

@riverpod
class SessionNotifier extends _$SessionNotifier {
  late FlutterSecureStorage localStorage;
  @override
  FutureOr<void> build() async {
    // here update localStorage from remote (account and other settings)
    localStorage = const FlutterSecureStorage();

    // localStorage.write(key: "account", value: jsonEncode(object));
  }

  Future<void> setToken(String token) async {
    return await localStorage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await localStorage.read(key: 'token');
  }

  FlutterSecureStorage get() {
    return localStorage;
  }

  Future<void> clear() async {
    return await localStorage.deleteAll();
  }

  
}
