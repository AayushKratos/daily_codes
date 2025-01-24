import 'dart:async';

Future<int> addNumbers(int a, int b) async {
  return a + b;
}

void main() {
  addNumbers(5, 3).then((result) {
    print("Sum: $result");
  });
}
