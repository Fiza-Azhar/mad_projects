import 'package:flutter/material.dart';
import 'bank_account.dart';

class CreateAccount extends StatefulWidget {
  final BankAccount account;

  CreateAccount(this.account);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Account Number: ${widget.account.accountNumber}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the main menu
              },
              child: Text('Back to Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
