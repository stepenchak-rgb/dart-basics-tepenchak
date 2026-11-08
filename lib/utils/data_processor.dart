import '../models/university.dart';
import '../models/student.dart';
class DataProcessor {
  static List<int> filterEvenNumbers(List<int> numbers) => numbers.where((n)=>n.isEven).toList();
  static Map<String,int> countWords(String text) { final result=<String,int>{}; for(final word in text.toLowerCase().split(RegExp(r'[^a-zA-Z0-9А-Яа-яІіЇїЄєҐґ]+')).where((w)=>w.isNotEmpty)) { result[word]=(result[word] ?? 0)+1; } return result; }
  static List<Map<String,dynamic>> sortStudentsByGPA(List<Student> students) { final sorted=[...students]..sort((a,b)=>b.gpa.compareTo(a.gpa)); return sorted.map((s)=>{'name':s.fullName,'gpa':s.gpa}).toList(); }
  static Set<String> getUniqueSkills(List<Student> students) => students.expand((s)=>s.skills).toSet();
  static Set<String> findCommonCourses(List<Student> students) { if(students.isEmpty) return {}; var common=students.first.enrolledCourses.toSet(); for(final s in students.skip(1)) { common=common.intersection(s.enrolledCourses.toSet()); } return common; }
  static Map<String,List<Student>> groupStudentsByYear(List<Student> students) { final result=<String,List<Student>>{}; for(final s in students) { final year=s.birthDate.year.toString(); result.putIfAbsent(year,()=>[]).add(s); } return result; }
  static Map<String,double> calculateAverageGradesByCourse(List<Student> students) { final totals=<String,double>{}; final counts=<String,int>{}; for(final s in students) { for(final entry in s.grades.entries) { totals[entry.key]=(totals[entry.key] ?? 0)+entry.value; counts[entry.key]=(counts[entry.key] ?? 0)+1; } } return totals.map((k,v)=>MapEntry(k,v/counts[k]!)); }
  static List<Map<String,dynamic>> generateReport(University university) => university.students.map((s)=>{'id':s.id,'student':s.fullName,'gpa':s.gpa,'passedCourses':s.getPassedCourses().length}).toList();
}
