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

class Cat extends Animal {
  @override
  void speak() {
    print("Meow!");
  }
}

void main() {
  Dog dog = Dog();
  dog.speak();
  dog.sleep();

  Cat cat = Cat();
  cat.speak();
  cat.sleep();
}
