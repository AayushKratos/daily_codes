class NewList {
  List newlist(List abc) {
    List finalList = [];
    finalList.add(abc.first);
    finalList.add(abc.last);
    return finalList;
  }
}

void main() {
  NewList obj = NewList();

  print(obj.newlist([5, 10, 15, 20, 25]));
}
