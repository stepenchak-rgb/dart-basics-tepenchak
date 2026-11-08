class Calculator {
  static double calculate(double a, double b, String operation) { switch(operation) { case '+': return a+b; case '-': return a-b; case '*': return a*b; case '/': if(b==0) throw ArgumentError('Division by zero'); return a/b; default: throw ArgumentError('Unknown operation'); } }
  static Map<String,int> analyzeText(String text) => {'characters':text.length,'words':text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length};
}
