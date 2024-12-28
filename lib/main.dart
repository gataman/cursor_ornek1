import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/jobs/presentation/bloc/jobs_bloc.dart';
import 'features/jobs/domain/repositories/job_repository.dart';
import 'features/jobs/presentation/pages/jobs_page.dart';
import 'features/auth/presentation/pages/register_page.dart';

final sl = di.sl;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JobsBloc(
            repository: sl<JobRepository>(),
          )..add(LoadJobs()),
        ),
      ],
      child: MaterialApp(
        title: 'İş İlanları',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const JobsPage(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
      ),
    );
  }
}
