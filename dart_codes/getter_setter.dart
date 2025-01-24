class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;

  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    } else {
      print("Name cannot be empty.");
    }
  }

  // Getter for the age
  int get age => _age;

  // Setter for the age
  set age(int newAge) {
    if (newAge >= 0) {
      _age = newAge;
    } else {
      print("Age cannot be negative.");
    }
  }
}

void main() {
  var person = Person("Alice", 30);

  print("Name: ${person.name}, Age: ${person.age}");

  // Using setter to change the values
  person.name = "Bob";
  person.age = 25;

  print("Updated Name: ${person.name}, Updated Age: ${person.age}");

  // Attempting invalid values
  person.name = ""; // Output: Name cannot be empty.
  person.age = -5; // Output: Age cannot be negative.
}
