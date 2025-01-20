import 'dart:math';

enum Operation { add, subtract, multiply, divide, square_root, power, modulus }

extension AdvancedOperations on double {
  double power(double exponent) {
    return exponent == 0 ? 1 : this * power(exponent - 1);
  }
}

class Calculator {
  List<String> history = [];

  double? performOperations(Operation operation, double a, double b) {
    try {
      switch (operation) {
        case Operation.add:
          return a + b;
        case Operation.subtract:
          return a - b;
        case Operation.multiply:
          return a * b;
        case Operation.divide:
          return a / b;
        case Operation.modulus:
          return a % b;
        case Operation.power:
          return a.power(b);
        case Operation.square_root:
          return sqrt(a);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return null;
    }
  }

  void saveHistory(String record) {
    history.add(record);
  }

  void displayHistory() {
    if (history.isEmpty) {
      print('No calculations were done');
    } else {
      print('Calculation History');
      for (var records in history) {
        print(records);
      }
    }
  }
}

void main() {
  Calculator calculator = Calculator();

  print('Example Calculations');
  double n1 = 10;
  double n2 = 5;

  double? addResult = calculator.performOperations(Operation.add, n1, n2);
  if (addResult != null) {
    calculator.saveHistory('Add:  $n1 + $n2 = $addResult');
    print('Addition result: $addResult');
  }

  double? subtractResult =
      calculator.performOperations(Operation.subtract, n1, n2);
  if (subtractResult != null) {
    calculator.saveHistory('Subtract: $n1 - $n2 = $subtractResult');
    print('Subtraction result: $subtractResult');
  }

  double? multiplyResult =
      calculator.performOperations(Operation.multiply, n1, n2);
  if (multiplyResult != null) {
    calculator.saveHistory('Multiple: $n1 * $n2 = $multiplyResult');
    print('Multiplication result: $multiplyResult');
  }

  double? divideResult = calculator.performOperations(Operation.divide, n1, n2);
  if (divideResult != null) {
    calculator.saveHistory('Divide: $n1 / $n2 = $divideResult');
    print('Division result: $divideResult');
  }

  double? powerResult = calculator.performOperations(Operation.power, n1, n2);
  if (powerResult != null) {
    calculator.saveHistory('Power: $n1 ^ $n2 = $powerResult');
    print('Power results: $powerResult');
  }

  double? squareRootResults =
      calculator.performOperations(Operation.square_root, n1, n2);
  if (squareRootResults != null) {
    calculator.saveHistory('Square Root: $n1 ^ 1/2');
    print('Square Root results: $squareRootResults');
  }

  double? modulusResults =
      calculator.performOperations(Operation.modulus, n1, n2);
  if (modulusResults != null) {
    calculator.saveHistory('Modulus: $n1 % $n2');
    print('Modulus results: $modulusResults');
  }

  calculator.displayHistory();
}
