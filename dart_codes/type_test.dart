void main() {
  var number = 42;
  var text = "Hello, Dart!";
  dynamic dynamicValue = 3.14;

  print(number is int);
  print(text is String);
  print(dynamicValue is double);
  print(dynamicValue is String);

  print(number is! String);
  print(text is! int);

  var value = dynamicValue as double;
  print(value * 2);
}
