import 'package:emiliano_cesare_flutter_template/api/endpoints.dart';
import 'package:emiliano_cesare_flutter_template/api/request.dart';

class AuthRepository {
  Future<void> login(String email, String password) async {
    try {
    var payload = {
      'email': email,
      'password': password,
    };

    var token = "xxxxx"; // Usually you get this from local storage

    var response = await handlePost(url: authLoginUrl, token: token);

    // handle response
    } catch (e) {
      // handle error
    }
  }

  Future<void> register(String email, String password) async {
    // Implement Register
  }

  Future<void> logout() async {
    // Implement Logout
  }
}