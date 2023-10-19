import 'package:flutter/material.dart';
import 'bank_account.dart';

class Deposit extends StatefulWidget {
  final BankAccount account;

  Deposit(this.account);

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Account Number: ${widget.account.accountNumber}'),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double amount = double.parse(amountController.text);
                widget.account.deposit(amount);
                Navigator.pop(context); // Navigate back to the main menu
              },
              child: Text('Deposit'),
            ),
          ],
        ),
      ),
    );
  }
}
