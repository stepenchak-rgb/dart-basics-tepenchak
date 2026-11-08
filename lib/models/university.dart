import 'student.dart';
import 'course.dart';
export 'student.dart';
export 'course.dart';
abstract class Person {
  final String id, firstName, lastName;
  final DateTime birthDate;
  Person({required this.id, required this.firstName, required this.lastName, required this.birthDate});
  String get fullName => '$firstName $lastName';
  int get age { final now = DateTime.now(); return now.year - birthDate.year - ((now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) ? 1 : 0); }
  String get role;
}
class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;
  Professor({required super.id, required super.firstName, required super.lastName,
    required super.birthDate, required this.department, required this.salary,
    List<String>? taughtCourses}) : taughtCourses = taughtCourses ?? [];
  @override String get role => 'Professor';
  void assignCourse(String id) { if (!taughtCourses.contains(id)) taughtCourses.add(id); }
  @override String toString() => '$role: $fullName ($department)';
}
class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;
  University({required this.name, List<Student>? students, List<Professor>? professors, List<Course>? courses}) : students=students ?? [], professors=professors ?? [], courses=courses ?? [];
  void addStudent(Student student) { if (findStudentById(student.id) != null) throw StateError('Duplicate student ID'); students.add(student); }
  void removeStudent(String id) => students.removeWhere((s) => s.id == id);
  Student? findStudentById(String id) { for (final s in students) { if (s.id == id) return s; } return null; }
  List<Student> getStudentsByCourse(String id) => students.where((s) => s.enrolledCourses.contains(id)).toList();
  List<Course> getAvailableCoursesForStudent(String studentId) { final student=findStudentById(studentId); if(student==null) return []; return courses.where((c) => !student.enrolledCourses.contains(c.id) && c.canStudentEnroll(student)).toList(); }
  Map<String,dynamic> generateStatistics() => {'university':name,'students':students.length,'professors':professors.length,'courses':courses.length,'averageGPA':students.isEmpty ? 0.0 : students.map((s)=>s.gpa).reduce((a,b)=>a+b)/students.length};
}
