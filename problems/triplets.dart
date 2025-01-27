class Triplets {
  List triplets(List a, List b) {
    int c1 = 0;
    int c2 = 0;

    List res = [];

    for (int i = 0; i < a.length; i++) {
      if (a.elementAt(i) > b.elementAt(i)) {
        c1++;
      } else if (a.elementAt(i) < b.elementAt(i)) {
        c2++;
      } else {
        continue;
      }
    }
    res.add(c1);
    res.add(c2);
    return res;
  }
}

void main() {
  Triplets obj = Triplets();
  print(obj.triplets([1, 2, 6, 4, 5], [5, 4, 3, 2, 1]));
}
