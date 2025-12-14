import 'dart:math';

abstract class AuthRepository {
  Future<Map<String, dynamic>> login(
      String email,
      String password,
      );
}

class DummyAuthRepository implements AuthRepository {
  @override
  Future<Map<String, dynamic>> login(
      String email,
      String password,
      ) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email.isEmpty || password.isEmpty) {
      throw Exception("Invalid credentials");
    }

    return {
      "name": "Suryam",
      "jwt_token": _generateToken(),
    };
  }

  String _generateToken() {
    final random = Random();
    return List.generate(
      32,
          (_) => random.nextInt(36).toRadixString(36),
    ).join();
  }
}
