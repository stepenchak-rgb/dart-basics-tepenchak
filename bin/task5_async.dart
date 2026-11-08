import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:dart_basics_tepenchak/models/student.dart';
Future<String> fetchStudentData(String id) async { await Future.delayed(const Duration(milliseconds:150)); return 'Loaded student $id'; }
Future<List<Student>> loadStudentsFromFile(String filename) async { final text=await File(filename).readAsString(); final list=jsonDecode(text) as List<dynamic>; return list.map((e)=>Student.fromJson(Map<String,dynamic>.from(e as Map))).toList(); }
Future<void> saveStudentsToFile(List<Student> students,String filename) async { await File(filename).parent.create(recursive:true); await File(filename).writeAsString(jsonEncode(students.map((s)=>s.toJson()).toList())); }
Stream<Student> studentStream() async* { for(final i in [1,2,3]) { await Future.delayed(const Duration(milliseconds:50)); yield Student(id:'S$i',firstName:'Student',lastName:'$i',birthDate:DateTime(2000,1,1)); } }
Future<void> demonstrateFutures() async { final timer=Stopwatch()..start(); final results=await Future.wait([fetchStudentData('S1'),fetchStudentData('S2')]).timeout(const Duration(seconds:3)); timer.stop(); print('Future.wait: $results (${timer.elapsedMilliseconds} ms)'); try { await fetchStudentData('S3').timeout(const Duration(milliseconds:1)); } on TimeoutException catch (_) { print('Timeout handled correctly'); } }
Future<void> demonstrateStreams() async { final ids=await studentStream().map((s)=>s.id).toList(); print('Stream transformed IDs: $ids'); await for(final s in studentStream().where((s)=>s.id!='S2')) { print('Stream listen: ${s.fullName}'); } }
Future<void> demonstrateFileOperations() async { final students=[Student(id:'S1',firstName:'Serhii',lastName:'Tepenchak',birthDate:DateTime(1999,10,10),grades:{'DART':92})]; final timer=Stopwatch()..start(); await saveStudentsToFile(students,'output/students.json'); final loaded=await loadStudentsFromFile('output/students.json'); timer.stop(); print('JSON file read/write: ${loaded.map((s)=>s.fullName).toList()} (${timer.elapsedMilliseconds} ms)'); }
Future<void> main() async { print('=== Dart Async Programming Demo ==='); await demonstrateFutures(); await demonstrateStreams(); await demonstrateFileOperations(); }
