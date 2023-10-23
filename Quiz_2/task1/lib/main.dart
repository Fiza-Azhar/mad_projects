import 'package:flutter/material.dart';
import 'forgotPass_screen.dart';
import 'accounts.dart';

void main() {
  runApp(ForgotPasswordApp());
}

class ForgotPasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ForgotPasswordScreen(),
        '/account': (context) => AccountScreen(),
      },
    );
  }
}
