mixin Walkable {
  void walk() {
    print("Walking...");
  }
}

mixin Runnable {
  void run() {
    print("Running...");
  }
}

class Person with Walkable, Runnable {}

void main() {
  var person = Person();
  person.walk();
  person.run();
}
