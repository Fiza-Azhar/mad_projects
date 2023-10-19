import 'package:flutter/material.dart';
import 'create_account.dart';
import 'deposit.dart';
import 'withdraw.dart';
import 'check_balance.dart';
import 'bank_account.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  final BankAccount account = BankAccount(); // Initialize the bank account

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banking App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount(account)),
                );
              },
              child: Text('Create Account'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Deposit(account)),
                );
              },
              child: Text('Deposit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Withdraw(account)),
                );
              },
              child: Text('Withdraw'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckBalance(account)),
                );
              },
              child: Text('Check Balance'),
            ),
            ElevatedButton(
              onPressed: () {
                // Exit the app
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
