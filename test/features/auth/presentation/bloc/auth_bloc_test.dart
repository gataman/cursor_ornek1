import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cursor_ornek1/core/error/failures.dart';
import 'package:cursor_ornek1/features/auth/domain/entities/user.dart';
import 'package:cursor_ornek1/features/auth/domain/usecases/login_usecase.dart';
import 'package:cursor_ornek1/features/auth/presentation/bloc/auth_bloc.dart';

import 'auth_bloc_test.mocks.dart';

// Run 'dart run build_runner build' to generate the mock file
@GenerateMocks([LoginUseCase])
void main() {
  late AuthBloc bloc;
  late MockLoginUseCase mockLoginUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    bloc = AuthBloc(loginUseCase: mockLoginUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  const tEmail = 'test@test.com';
  const tPassword = '123456';
  const tUser = User(email: tEmail, token: 'test_token');

  test('initial state should be AuthInitial', () {
    expect(bloc.state, AuthInitial());
  });

  blocTest<AuthBloc, AuthState>(
    'should emit [AuthLoading, AuthSuccess] when login is successful',
    build: () {
      when(mockLoginUseCase(any, any))
          .thenAnswer((_) async => const Right(tUser));
      return bloc;
    },
    act: (bloc) => bloc.add(LoginEvent(email: tEmail, password: tPassword)),
    expect: () => [
      AuthLoading(),
      AuthSuccess(tUser),
    ],
    verify: (_) {
      verify(mockLoginUseCase(tEmail, tPassword));
      verifyNoMoreInteractions(mockLoginUseCase);
    },
  );

  blocTest<AuthBloc, AuthState>(
    'should emit [AuthLoading, AuthError] when login fails',
    build: () {
      when(mockLoginUseCase(any, any)).thenAnswer(
          (_) async => const Left(AuthFailure('Invalid credentials')));
      return bloc;
    },
    act: (bloc) => bloc.add(LoginEvent(email: tEmail, password: tPassword)),
    expect: () => [
      AuthLoading(),
      AuthError('Invalid credentials'),
    ],
    verify: (_) {
      verify(mockLoginUseCase(tEmail, tPassword));
      verifyNoMoreInteractions(mockLoginUseCase);
    },
  );
}
