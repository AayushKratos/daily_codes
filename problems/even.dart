void main() {
  List a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

  List even = [];
  for (var i in a) {
    if (i % 2 == 0) {
      even.add(i);
    }
  }
  print(even);
}
