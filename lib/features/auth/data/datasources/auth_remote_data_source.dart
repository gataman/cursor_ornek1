import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String password);
}

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    if (email == "test@test.com" && password == "123456") {
      return UserModel(
        email: email,
        token: 'fake_token_123',
      );
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<UserModel> register(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    return UserModel(
      email: email,
      token: 'fake_token_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
