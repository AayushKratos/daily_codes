Future<int> addNumbers(int a, int b) async {
  return a + b;
}

void main() async {
  int result = await addNumbers(5, 3);
  print("Sum: $result");
}
