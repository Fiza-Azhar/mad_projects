import 'package:flutter/material.dart';
//import 'forgotPass_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Accounts",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      "Manage accounts",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              AccountItem("User 1", "user1@example.com"),
              AccountItem("User 2", "user2@example.com"),
              AccountItem("User 3", "user3@example.com"),
              AccountItem("User 4", "user4@example.com"),
              AccountItem("User 5", "user5@example.com"),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  final String name;
  final String email;

  AccountItem(this.name, this.email);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage("URL_TO_PROFILE_PHOTO"),
            radius: 30.0,
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
