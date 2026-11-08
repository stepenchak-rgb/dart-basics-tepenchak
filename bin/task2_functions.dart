import 'package:dart_basics_tepenchak/utils/calculator.dart';
void main() { print('=== Dart Functions Demo ==='); testBasicFunctions(); testAdvancedFunctions(); testFunctionalProgramming(); }
int calculateSum(int a,int b)=>a+b;
double calculateAverage(List<double> numbers) => numbers.isEmpty ? 0 : numbers.reduce((a,b)=>a+b)/numbers.length;
String formatName(String firstName,String lastName,{String? middleName,bool uppercase=false}) { final value=[firstName,if(middleName!=null) middleName,lastName].join(' '); return uppercase ? value.toUpperCase() : value; }
int fibonacci(int n) { if(n<0) throw ArgumentError('n must be non-negative'); return n<2 ? n : fibonacci(n-1)+fibonacci(n-2); }
int factorial(int n) { if(n<0) throw ArgumentError('n must be non-negative'); return n<=1 ? 1 : n*factorial(n-1); }
void testBasicFunctions() { print('Sum: ${calculateSum(10,20)}; average: ${calculateAverage([10,20,30])}'); print('Calculator: ${Calculator.calculate(10,2,'/')}'); print('Text: ${Calculator.analyzeText('Dart makes apps')}'); }
void testAdvancedFunctions() { print(formatName('Serhii','Tepenchak',middleName:'M.',uppercase:true)); print('Fibonacci(7)=${fibonacci(7)}; factorial(5)=${factorial(5)}'); }
void testFunctionalProgramming() { final numbers=[1,2,3,4,5]; print('map: ${numbers.map((n)=>n*n).toList()}'); print('where: ${numbers.where((n)=>n.isEven).toList()}'); print('fold: ${numbers.fold<int>(0,(sum,n)=>sum+n)}'); Function makeCounter() { var count=0; return () => ++count; } final counter=makeCounter(); print('Closure: ${counter()}, ${counter()}'); }
