import '../../domain/entities/job.dart';

class JobModel extends Job {
  const JobModel({
    required super.id,
    required super.title,
    required super.company,
    required super.location,
    required super.description,
    required super.requirements,
    required super.salary,
    required super.postedDate,
    required super.employmentType,
    required super.experienceLevel,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      location: json['location'],
      description: json['description'],
      requirements: List<String>.from(json['requirements']),
      salary: json['salary'],
      postedDate: DateTime.parse(json['postedDate']),
      employmentType: json['employmentType'],
      experienceLevel: json['experienceLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'description': description,
      'requirements': requirements,
      'salary': salary,
      'postedDate': postedDate.toIso8601String(),
      'employmentType': employmentType,
      'experienceLevel': experienceLevel,
    };
  }
}
