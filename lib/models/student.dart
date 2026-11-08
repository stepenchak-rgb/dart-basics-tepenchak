class Student {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<String> enrolledCourses;
  final Map<String, double> grades;
  final List<String> skills;

  Student({required this.id, required this.firstName, required this.lastName,
    required this.birthDate, List<String>? enrolledCourses,
    Map<String, double>? grades, List<String>? skills})
      : enrolledCourses = enrolledCourses ?? [], grades = grades ?? {},
        skills = skills ?? [];

  String get fullName => '$firstName $lastName';
  int get age { final today = DateTime.now(); var years = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) years--;
    return years; }
  double get gpa => grades.isEmpty ? 0 : grades.values.reduce((a,b) => a+b) / grades.length;
  void enrollInCourse(String courseId) { if (!enrolledCourses.contains(courseId)) enrolledCourses.add(courseId); }
  void addGrade(String courseId, double grade) { if (grade < 0 || grade > 100) throw ArgumentError('Grade must be 0..100'); enrollInCourse(courseId); grades[courseId] = grade; }
  List<String> getPassedCourses() => grades.entries.where((e) => e.value >= 60).map((e) => e.key).toList();
  @override String toString() => '$fullName ($id), GPA: ${gpa.toStringAsFixed(1)}';
  Map<String,dynamic> toJson() => {'id':id,'firstName':firstName,'lastName':lastName,'birthDate':birthDate.toIso8601String(),'enrolledCourses':enrolledCourses,'grades':grades,'skills':skills};
  factory Student.fromJson(Map<String,dynamic> json) => Student(id:json['id'] as String, firstName:json['firstName'] as String, lastName:json['lastName'] as String, birthDate:DateTime.parse(json['birthDate'] as String), enrolledCourses:List<String>.from(json['enrolledCourses'] ?? []), grades:(json['grades'] as Map<String,dynamic>? ?? {}).map((k,v) => MapEntry(k,(v as num).toDouble())), skills:List<String>.from(json['skills'] ?? []));
}
