void main() {
  List a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  Set convert1 = a.toSet();
  Set convert2 = b.toSet();

  Set res = {};
  for (var i in convert1) {
    for (var j in convert2) {
      if (i == j) {
        res.add(j);
      }
    }
  }

  print(res.toList());
}
