extension StringExtensions on String {
  String reverse() => split('').reversed.join();

  int get vowelCount =>
      toLowerCase().split('').where((char) => 'aeiou'.contains(char)).length;
}

void main() {
  String name = "Flutter";

  print("Original: $name");
  print("Reversed: ${name.reverse()}");
  print("Vowel Count: ${name.vowelCount}");
}
