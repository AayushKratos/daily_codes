class Reverse {
  String rev(String abc) {
    String res = abc.split(" ").reversed.toList().join(" ");
    return res;
  }
}

void main() {
  Reverse obj = Reverse();
  print(obj.rev('Hello I am Aayush'));
}
