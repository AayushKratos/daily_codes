class RotateLeft {
  List rotate(List abc, int d) {
    List res = [];
    List right = [];
    List left = [];
    right = abc.sublist(0, d);
    left = abc.sublist(d, abc.length);

    res.addAll(left);
    res.addAll(right);
    return res;
  }
}

void main() {
  RotateLeft obj = RotateLeft();

  print(obj.rotate([1, 2, 3, 4, 5], 2));
}
