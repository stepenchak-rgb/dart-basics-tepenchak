
import 'package:dart_basics_tepenchak/utils/calculator.dart';

void main() {
  print('=== Dart Variables & Types Demo ===');

  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();

  print('Calculator: ${Calculator.calculate(10, 5, '*')}');
  print(
    'Text analysis: ${Calculator.analyzeText('Dart is fun and useful')}',
  );
}

// 1. Числові типи даних
void demonstrateNumbers() {
  int a = 10;
  double b = 3.5;
  num c = a + b;

  print(
    'Numbers: int=$a double=$b num=$c, '
    'sum=${a + b}, division=${a / b}',
  );

  print(
    'Conversions: ${a.toDouble()}, '
    '${b.toInt()}, ${int.parse('42')}',
  );
}

// 2. Рядки
void demonstrateStrings() {
  String name = 'Serhii';

  print(
    'Hello $name! Uppercase: ${name.toUpperCase()}, '
    'length: ${name.length}',
  );

  print('Multiline: ${'''first line
second line'''}');

  print('Escape: \n is a newline escape');
}

// 3. Логічні значення
void demonstrateBooleans() {
  bool isStudent = true;
  int age = 27;

  print(
    'Boolean: $isStudent, '
    'adult=${age >= 18}, '
    'logic=${isStudent && age > 18}, '
    'status=${age >= 18 ? 'adult' : 'minor'}',
  );
}

// 4. Колекції
void demonstrateCollections() {
  List<String> fruits = ['Apple', 'Banana'];

  Set<int> unique = {1, 2};

  Map<String, int> scores = {
    'Dart': 95,
  };

  fruits.add('Orange');

  print('List: $fruits; Set: $unique; Map: $scores');
}

// 5. Null Safety
void demonstrateNullSafety() {
  String? nickname;

  print('Nullable: ${nickname ?? 'not provided'}');

  nickname = 'Sam';

  print('Nickname length: ${nickname.length}');

  late String course;
  course = 'Dart';

  print(
    'Late: $course, required: ${greet(name: 'Student')}',
  );
}

// 6. Функція з обов'язковим параметром
String greet({required String name}) {
  return 'Hello $name';
}
