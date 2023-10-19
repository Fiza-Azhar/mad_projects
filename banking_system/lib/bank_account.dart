/*import 'dart:math';
class BankAccount {
  String accountNumber;
  double balance;

  BankAccount() : accountNumber = '', balance = 0.0;

  void initializeAccount() {
    accountNumber = generateAccountNumber(); // Generate a unique account number
    balance = 0.0;
  }

  String generateAccountNumber() {
    // Generate a unique account number using a timestamp and random numbers
    final millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(99999); // Generate a random 5-digit number
    return '$millisecondsSinceEpoch$random';
  }
  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    }
    return false;
  }

  double getBalance() {
    return balance;
  }
}*/
import 'dart:math';

class BankAccount {
  late String accountNumber;
  late double balance;

  BankAccount() {
    initializeAccount();
  }

  void initializeAccount() {
    accountNumber = generateAccountNumber();
    balance = 0.0;
  }

  String generateAccountNumber() {
    final millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(99999);
    return '$millisecondsSinceEpoch$random';
  }

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    }
    return false;
  }

  double getBalance() {
    return balance;
  }
}
