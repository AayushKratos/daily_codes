typedef MathOperation = int Function(int a, int b);

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

void performOperation(MathOperation operation, int x, int y) {
  print("Result: ${operation(x, y)}");
}

void main() {
  performOperation(add, 5, 3);
  performOperation(subtract, 10, 4);

  MathOperation multiply = (int a, int b) => a * b;
  performOperation(multiply, 6, 7);

  var calculator = Calculator();
  performOperation(calculator.divide, 20, 5);
}

class Calculator {
  int divide(int a, int b) => a ~/ b;
}
