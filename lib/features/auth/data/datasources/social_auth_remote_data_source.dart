import '../models/user_model.dart';

abstract class SocialAuthRemoteDataSource {
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithApple();
}

class FakeSocialAuthRemoteDataSource implements SocialAuthRemoteDataSource {
  @override
  Future<UserModel> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(
      email: 'user@gmail.com',
      token: 'google_fake_token_123',
    );
  }

  @override
  Future<UserModel> signInWithApple() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(
      email: 'user@icloud.com',
      token: 'apple_fake_token_123',
    );
  }
}
