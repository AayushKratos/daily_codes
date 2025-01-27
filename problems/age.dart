import 'dart:io';

void main() {
  print('Enter your name:');
  dynamic name = stdin.readLineSync();

  print('Enter your age:');
  dynamic age_string = stdin.readLineSync();
  int age = int.parse(age_string!);

  print('$name is the name');
  print('You have ${100 - age} years to be 100');
}
