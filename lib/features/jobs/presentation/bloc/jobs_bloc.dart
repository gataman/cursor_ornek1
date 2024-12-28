import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repositories/job_repository.dart';
import '../../domain/entities/job.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobRepository repository;

  JobsBloc({required this.repository}) : super(JobsInitial()) {
    on<LoadJobs>((event, emit) async {
      emit(JobsLoading());
      final result = await repository.getJobs();
      result.fold(
        (failure) => emit(const JobsError(
            message: 'İş ilanları yüklenirken bir hata oluştu')),
        (jobs) => emit(JobsLoaded(jobs: jobs)),
      );
    });
  }
}
