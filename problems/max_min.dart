class MaxMin {
  List maxmin(List abc) {
    int len = abc.length;
    int c = 0;

    List res = [];
    for (int i = 0; i < len; i++) {
      if (i == c) {
        continue;
      } else {
        res.add(abc.elementAt(i) + abc.elementAt(i + 1));
        c++;
      }
    }
    print(res);
    return res;
  }
}

void main() {
  MaxMin obj = MaxMin();
  obj.maxmin([1, 2, 3, 4, 5]);
}
