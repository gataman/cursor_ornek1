class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String description;
  final List<String> requirements;
  final String salary;
  final DateTime postedDate;
  final String employmentType; // Tam zamanlı, yarı zamanlı vs.
  final String experienceLevel; // Junior, Senior vs.
  final String? imageUrl;

  const Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.requirements,
    required this.salary,
    required this.postedDate,
    required this.employmentType,
    required this.experienceLevel,
    this.imageUrl,
  });
}
