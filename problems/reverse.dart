class Reverse {
  List rev(List abc) {
    List res = abc.reversed.toList();
    return res;
  }
}

void main() {
  Reverse obj = Reverse();
  print(obj.rev([1, 3, 2]));
}
