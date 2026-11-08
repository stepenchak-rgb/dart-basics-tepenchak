# Practical work 4: Dart Basics

Course: Programming for Mobile Platforms. Project: `dart_basics_tepenchak`.

## Requirements
Install Dart SDK 3.0+ from https://dart.dev/get-dart, VS Code with Dart extension, and Git.

## Install and run
Open a terminal **in the project root** (folder containing `pubspec.yaml`):

```bash
dart --version
dart pub get
dart run bin/task1_variables.dart
dart run bin/task2_functions.dart
dart run bin/task3_classes.dart
dart run bin/task4_collections.dart
dart run bin/task5_async.dart
dart analyze
dart format .
dart test
dart test --coverage=coverage
```

Task 1 demonstrates basic Dart types, collections, null safety, calculator and text analysis. Task 2 covers functions, named parameters, recursion and functional programming. Task 3 demonstrates `Student`, `Course`, `Professor`, `University`, CRUD and GPA. Task 4 reads `data/students.csv`, processes collections and writes `output/analysis_report.txt`. Task 5 demonstrates Future, Stream, JSON file I/O and simple timings.

## Example
```dart
final student = Student(id: 'S1', firstName: 'Anna', lastName: 'Bondar', birthDate: DateTime(2000, 1, 1));
student.enrollInCourse('DART');
student.addGrade('DART', 90);
print(student.gpa);
```

## Architecture
See `docs/uml.md` for Mermaid class diagram. Source is in `lib/models/` and `lib/utils/`; executable demos are in `bin/`; unit tests are in `test/`.

## Evidence to produce on your own computer
- Run all five programs and save real terminal screenshots.
- Run `dart analyze`, `dart test`, coverage command and save actual results.
- Make a public GitHub repository named `dart-basics-tepenchak` and push your own meaningful commits as you work. Do not fabricate commit history.
- Review, understand and improve the code before submitting or presenting it.

## AI-use declaration (edit to reflect actual work)
Tool: ChatGPT (OpenAI). Purpose: guidance on Dart concepts, project structure and generation of an initial example code scaffold. Example prompts: 'давай зробимо все правильно і швидко'; 'підготуй проєкт за всіма вимогами методички'. AI-generated material included: initial implementations of the demo applications, models, utilities, tests and README. Independent work to record before submission: [describe which parts you personally tested, understood, changed, debugged, and documented]. Do not submit this placeholder unchanged.
