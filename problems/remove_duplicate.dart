class RemoveDuplicate {
  Set removeDuplicate(List abc) {
    Set res = abc.toSet();
    return res;
  }
}

void main() {
  RemoveDuplicate obj = RemoveDuplicate();

  Set res = obj.removeDuplicate([1, 1, 2, 2, 3, 4, 5, 6, 7, 7]);

  print(res.toList());
}
