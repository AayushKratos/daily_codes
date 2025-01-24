extension type Celsius(double value) {
  double toFahrenheit() => value * 9 / 5 + 32;
}

void main() {
  Celsius temp = Celsius(25); // 25°C
  print("Temperature in Fahrenheit: ${temp.toFahrenheit()}"); // 77°F
}
