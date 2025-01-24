void main() {
  late String name;
  name = "John Doe";
  print(name);

  late List<int> numbers = _generateLargeList();
  print("Numbers variable declared but not initialized yet.");
  print(numbers);
}

List<int> _generateLargeList() {
  print("Generating large list...");
  return [1, 2, 3, 4, 5];
}
