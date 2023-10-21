import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyHome()), // use MaterialApp
  );
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('Title'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.lightGreen.shade500,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Flutter World',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.deepPurpleAccent,
                        decorationStyle: TextDecorationStyle.dotted,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' for',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' Mobile',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Divider(),
                  Text('Column 1'),
                  Divider(),
                  Text('Column 2'),
                  Divider(),
                  Text('Column 3'),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Columns and Row Nesting 1',
                  ),
                  Text(
                    'Columns and Row Nesting 2',
                  ),
                  Text(
                    'Columns and Row Nesting 3',
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Row Nesting 1'),
                      Text('Row Nesting 2'),
                      Text('Row Nesting 3'),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Row 1'),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                      ),
                      Text('Row 2'),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                      ),
                      Text('Row 3'),
                    ],
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.flag),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.school)),
              Icon(
                Icons.brush,
                color: Colors.lightBlue,
                size: 48.0,
              ),
              Icon(
                Icons.brush,
                color: Colors.purple,
                size: 88.0,
              ),
              TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 16.0,
              ),
              decoration: InputDecoration(
              labelText: "Notes",
              labelStyle: TextStyle(color: Colors.purple),
              //border: UnderlineInputBorder(),
              //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color.
              border:OutlineInputBorder()
              )
              ),
              TextFormField(
              decoration: InputDecoration(labelText: 'Enter your notes'),
              ),  


            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
          ],
        ),
      ),
    );
  }
}
