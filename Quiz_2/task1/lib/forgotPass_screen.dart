import 'package:flutter/material.dart';
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

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password?"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Enter your email that you used to register your account so we can reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Arial', // Replace with your desired font
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Arial', // Replace with your desired font
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: Text("Switch to Accounts"),
            ),
            SizedBox(height: 16.0),
            Opacity(
              opacity: 0.6,
              child: Text(
                "Forgot your email? Use phone number",
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Arial', // Replace with your desired font
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
