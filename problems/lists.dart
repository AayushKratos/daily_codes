void main() {
  List ab = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  Set con = ab.toSet();

  Set res = {};
  for (var i in con) {
    if (i < 5) {
      res.add(i);
    }
  }
  print(res.toList());
}
