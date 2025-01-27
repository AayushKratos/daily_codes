class Fibonacci {
  List fibonacci(int num) {
    List res = [0, 1];
    int a = 0;
    int b = 1;
    int c;

    for (int i = 1; i <= num; i++) {
      c = a + b;
      res.add(c);
      a = b;
      b = c;
    }
    return res;
  }
}

void main() {
  Fibonacci obj = Fibonacci();
  print(obj.fibonacci(5));
}
