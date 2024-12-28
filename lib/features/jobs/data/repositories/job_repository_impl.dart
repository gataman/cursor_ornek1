import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/job.dart';
import '../../domain/repositories/job_repository.dart';
import '../datasources/fake_job_service.dart';

class JobRepositoryImpl implements JobRepository {
  final FakeJobService jobService;

  JobRepositoryImpl({required this.jobService});

  @override
  Future<Either<Failure, List<Job>>> getJobs() async {
    try {
      final jobs = await jobService.getJobs();
      return Right(jobs);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Job>> getJobById(String id) async {
    try {
      final job = await jobService.getJobById(id);
      return Right(job!);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
