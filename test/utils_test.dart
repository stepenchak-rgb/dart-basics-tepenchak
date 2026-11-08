import 'package:test/test.dart';
import 'package:dart_basics_tepenchak/utils/calculator.dart';
import 'package:dart_basics_tepenchak/utils/data_processor.dart';
void main() { test('Calculator', () { expect(Calculator.calculate(4,2,'+'),6); expect(Calculator.calculate(4,2,'/'),2); expect(()=>Calculator.calculate(4,0,'/'),throwsArgumentError); }); test('Text analysis', () { expect(Calculator.analyzeText('one two')['words'],2); }); test('Data processor', () { expect(DataProcessor.filterEvenNumbers([1,2,3,4]),[2,4]); expect(DataProcessor.countWords('dart dart flutter'),{'dart':2,'flutter':1}); }); }
