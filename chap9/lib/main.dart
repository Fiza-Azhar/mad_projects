import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Silver Widgets List'),
        ),
        body: MySilverList(),
      ),
    );
  }
}

class MySilverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Silver Widgets List'),
            background: Image.asset('assets/Images/download.jpg')
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // You can replace the container with your custom widget
              return Container(
                height: 80.0,
                //color: index % 2 == 0 ? Colors.blue : Colors.green,
                child: Center(
                  child: Text('Item $index'),
                ),
              );
            },
            childCount: 20, // Replace with the number of items you want
          ),
        ),
      ],
    );
  }
}



/*import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Home(), // Use the Home widget as the home screen
    );
  }
}

class MyCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      elevation: 8.0,
      color: Colors.white,
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Barista',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48.0,
              color: Colors.orange,
            ),
          ),
          Text(
            'Travel Plans',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
} */









/*
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Center(
          child: Card(
            elevation: 8.0,
            color: Colors.white,
            margin: EdgeInsets.all(16.0),
            shape: StadiumBorder(), // Create a Stadium Border
            // shape: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.deepOrange),
            // ), // Create Square Corners Card with a Single Orange Bottom Border
            // shape: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.deepOrange.withOpacity(0.5)),
            // ), // Create Rounded Corners Card with Orange Border
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Barista',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Travel Plans',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
