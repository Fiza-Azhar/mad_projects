import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // User profile picture and name
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/2.jpeg'),
                  radius: 50.0,
                ),
                SizedBox(height: 12),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Hi Im John ', // Add the user's bio here
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          
          // User followers and following count
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Followers: 100'),
                Text('Following: 50'),
              ],
            ),
          ),

          // User portfolio or posts (similar to Instagram)
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              itemCount: 12, // Replace with the actual number of user posts
              itemBuilder: (context, index) {
                return Image.asset('assets/images/p2.jpeg');
                // You can load user posts from your server or assets
              },
            ),
          ),
        ],
      ),
    );
  }
}
