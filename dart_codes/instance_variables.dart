class Employee {
  String name;
  int age;
  late double salary;

  Employee(this.name, [this.age = 30]);

  void setSalary(double amount) {
    salary = amount;
  }

  void display() {
    print('Name: $name, Age: $age, Salary: $salary');
  }
}

void main() {
  var emp = Employee('John');
  emp.setSalary(50000.0);
  emp.display();
}
