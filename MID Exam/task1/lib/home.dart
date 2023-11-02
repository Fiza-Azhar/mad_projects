import 'package:flutter/material.dart';
import 'package:task1/profile.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: ListView(
        children: [
          // Add ListTiles for other friends as needed
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/2.jpeg'),
            ),
            title: GestureDetector(
              onTap: () {
                // Navigate to the user profile page when "Victor" is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                );
              },
              child: Text('Victor'),
            ),
            subtitle: Text('victor@example.com'),
          ),
          // Add more ListTiles for other friends as needed
          ListTile(
            leading: CircleAvatar(
             backgroundImage: AssetImage('assets/images/1.jpeg'),

            ),
            title: Text('Raphael Andre'),
            subtitle: Text('raphael andre@example.com'),
          ),
          ListTile(
            leading: CircleAvatar(
             backgroundImage: AssetImage('assets/images/img.jpeg'),
            ),
            title: Text('Imogen Hobbelink'),
            subtitle: Text('Imogen hobbelixmple.com'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:AssetImage('assets/images/3.jpeg'),
            ),
            title: Text('Lisa Garnier'),
            subtitle: Text('Imogen hobbelixmple.com'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/4.jpeg'),
            ),
            title: Text('Julia Parez'),
            subtitle: Text('Imogen hobbelixmple.com'),
          ),
          // Add more ListTiles for other friends as needed
        ],
      ),
    );
  }
}
