import 'package:flutter/material.dart';
import 'bank_account.dart';

class CheckBalance extends StatefulWidget {
  final BankAccount account;

  CheckBalance(this.account);

  @override
  _CheckBalanceState createState() => _CheckBalanceState();
}

class _CheckBalanceState extends State<CheckBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Balance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Account Number: ${widget.account.accountNumber}'),
            Text('Current Balance: \$${widget.account.getBalance().toStringAsFixed(2)}'),
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
