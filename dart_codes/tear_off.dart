int add(int a, int b) {
  return a + b;
}

void main() {
  var addFunction = add;

  print(addFunction(3, 4));
}
