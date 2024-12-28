import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cursor_ornek1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cursor_ornek1/features/auth/presentation/pages/login_page.dart';

import 'login_page_test.mocks.dart';

@GenerateMocks([AuthBloc])
void main() {
  late MockAuthBloc mockAuthBloc;
  late StreamController<AuthState> blocController;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    blocController = StreamController<AuthState>.broadcast();
    when(mockAuthBloc.state).thenReturn(AuthInitial());
    when(mockAuthBloc.stream).thenAnswer((_) => blocController.stream);
  });

  tearDown(() {
    blocController.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<AuthBloc>.value(
          value: mockAuthBloc,
          child: const LoginPage(),
        ),
      ),
    );
  }

  testWidgets(
    'should show error when email is empty',
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final loginButton = find.byType(ElevatedButton);
      expect(loginButton, findsOneWidget);

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Lütfen e-posta adresinizi girin'), findsOneWidget);
    },
  );

  testWidgets(
    'should show loading indicator when login is in progress',
    (WidgetTester tester) async {
      when(mockAuthBloc.state).thenReturn(AuthLoading());

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'should show error message when login fails',
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      blocController.add(AuthError('Invalid credentials'));
      await tester.pumpAndSettle();

      expect(find.text('Invalid credentials'), findsOneWidget);
    },
  );
}
