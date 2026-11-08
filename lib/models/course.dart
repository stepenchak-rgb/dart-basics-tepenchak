import 'student.dart';
class Course {
  final String id, name, description, instructor;
  final int credits;
  final List<String> prerequisites;
  Course({required this.id, required this.name, required this.description,
    required this.credits, required this.instructor, List<String>? prerequisites})
    : prerequisites = prerequisites ?? [];
  bool hasPrerequisites() => prerequisites.isNotEmpty;
  bool canStudentEnroll(Student student) => prerequisites.every(student.getPassedCourses().contains);
  @override String toString() => '$id: $name ($credits credits)';
}
