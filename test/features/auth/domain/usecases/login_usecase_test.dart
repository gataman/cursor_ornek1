import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cursor_ornek1/core/error/failures.dart';
import 'package:cursor_ornek1/features/auth/domain/entities/user.dart';
import 'package:cursor_ornek1/features/auth/domain/repositories/auth_repository.dart';
import 'package:cursor_ornek1/features/auth/domain/usecases/login_usecase.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  const tEmail = 'test@test.com';
  const tPassword = '123456';
  const tUser = User(email: tEmail, token: 'test_token');

  test(
    'should return User when the login is successful',
    () async {
      // arrange
      when(mockAuthRepository.login(any, any))
          .thenAnswer((_) async => const Right(tUser));

      // act
      final result = await loginUseCase(tEmail, tPassword);

      // assert
      expect(result, const Right(tUser));
      verify(mockAuthRepository.login(tEmail, tPassword));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'should return AuthFailure when the login fails',
    () async {
      // arrange
      when(mockAuthRepository.login(any, any)).thenAnswer(
          (_) async => const Left(AuthFailure('Invalid credentials')));

      // act
      final result = await loginUseCase(tEmail, tPassword);

      // assert
      expect(result, const Left(AuthFailure('Invalid credentials')));
      verify(mockAuthRepository.login(tEmail, tPassword));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
