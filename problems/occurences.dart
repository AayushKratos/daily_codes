class Occurences {
  List occur(List abc) {
    int pos = 0;
    int neg = 0;
    int zero = 0;

    List res = [];

    for (int i = 0; i < abc.length; i++) {
      if (abc.elementAt(i) > 0) {
        pos++;
      } else if (abc.elementAt(i) < 0) {
        neg++;
      } else {
        zero++;
      }
    }
    res.add(pos / 6);
    res.add(neg / 6);
    res.add(zero / 6);
    return res;
  }
}

void main() {
  Occurences obj = Occurences();
  print(obj.occur([2, 3, 0, 5, -6, -7, 0, 4, -2, 1]));
}
