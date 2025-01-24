class BankAccount {
  double balance;

  BankAccount(this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      return true;
    } else {
      print("Insufficient funds");
      return false;
    }
  }

  double getBalance() {
    return balance;
  }
}

void main() {
  var account = BankAccount(1000.0);
  account.deposit(500.0);
  print("Balance after deposit: ${account.getBalance()}");

  bool success = account.withdraw(200.0);
  if (success) {
    print("Balance after withdrawal: ${account.getBalance()}");
  }
}
