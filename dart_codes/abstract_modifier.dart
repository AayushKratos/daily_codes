abstract class Animal {
  void speak();

  void sleep() {
    print("The animal is sleeping.");
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print("Woof!");
  }
}

void main() {
  Dog dog = Dog();
  dog.speak();
  dog.sleep();
}
