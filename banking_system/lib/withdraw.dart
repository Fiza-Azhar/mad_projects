import 'package:flutter/material.dart';
import 'bank_account.dart';

class Withdraw extends StatefulWidget {
  final BankAccount account;

  Withdraw(this.account);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw'),
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
                if (widget.account.withdraw(amount)) {
                  Navigator.pop(context); // Navigate back to the main menu
                } else {
                  // Show an error message if withdrawal fails
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Insufficient balance'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
