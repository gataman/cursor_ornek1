import 'package:get_it/get_it.dart';

import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/jobs/domain/repositories/job_repository.dart';
import 'features/jobs/data/repositories/job_repository_impl.dart';
import 'features/jobs/data/datasources/fake_job_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => AuthBloc(loginUseCase: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => FakeAuthRemoteDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<JobRepository>(
    () => JobRepositoryImpl(jobService: sl()),
  );

  // Data sources
  sl.registerLazySingleton(() => FakeJobService());
}
