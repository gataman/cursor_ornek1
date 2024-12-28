import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cursor_ornek1/core/error/failures.dart';
import 'package:cursor_ornek1/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cursor_ornek1/features/auth/data/models/user_model.dart';
import 'package:cursor_ornek1/features/auth/data/repositories/auth_repository_impl.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(mockRemoteDataSource);
  });

  const tEmail = 'test@test.com';
  const tPassword = '123456';
  const tUserModel = UserModel(email: tEmail, token: 'test_token');

  group('login', () {
    test(
      'should return UserModel when the remote data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.login(any, any))
            .thenAnswer((_) async => tUserModel);

        // act
        final result = await repository.login(tEmail, tPassword);

        // assert
        expect(result, const Right(tUserModel));
        verify(mockRemoteDataSource.login(tEmail, tPassword));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return AuthFailure when the remote data source throws',
      () async {
        // arrange
        when(mockRemoteDataSource.login(any, any))
            .thenThrow(Exception('Invalid credentials'));

        // act
        final result = await repository.login(tEmail, tPassword);

        // assert
        expect(
          result,
          const Left(AuthFailure('Exception: Invalid credentials')),
        );
        verify(mockRemoteDataSource.login(tEmail, tPassword));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );
  });
}
