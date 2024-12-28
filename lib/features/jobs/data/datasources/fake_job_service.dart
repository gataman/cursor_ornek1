import '../models/job_model.dart';

class FakeJobService {
  static final List<JobModel> _jobs = [
    JobModel(
      id: '1',
      title: 'Flutter Geliştirici',
      company: 'Tech Co.',
      location: 'İstanbul, Türkiye',
      description:
          'Mobil uygulama geliştirme konusunda deneyimli Flutter geliştiriciler arıyoruz.',
      requirements: [
        'Flutter ve Dart dilinde en az 2 yıl deneyim',
        'State management (BLoC, Provider vb.) konusunda deneyim',
        'REST API entegrasyonu konusunda deneyim',
        'Git versiyon kontrol sistemi kullanımı',
      ],
      salary: '20000₺ - 35000₺',
      postedDate: DateTime.now().subtract(const Duration(days: 2)),
      employmentType: 'Tam Zamanlı',
      experienceLevel: 'Orta Seviye',
    ),
    // Daha fazla örnek iş ilanı eklenebilir
  ];

  Future<List<JobModel>> getJobs() async {
    await Future.delayed(
        const Duration(seconds: 1)); // Simüle edilmiş ağ gecikmesi
    return _jobs;
  }

  Future<JobModel?> getJobById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _jobs.firstWhere((job) => job.id == id);
  }
}
