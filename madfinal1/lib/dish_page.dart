import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:madfinal1/retrieve.dart';
//import 'package:madfinal1/retrievedata.dart';
import 'package:flutter/material.dart';


class DishPage extends StatefulWidget {
  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  String dishId = '';
  String dishName = '';
  double price = 0.0;
  bool isAvailable = false;
  String dishType = 'Main Course';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dish Details'),
         backgroundColor: Colors.green, // Set the background color to green
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Dish ID'),
              onChanged: (value) {
                setState(() {
                  dishId = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Dish Name'),
              onChanged: (value) {
                setState(() {
                  dishName = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  price = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Availability:'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value!;
                    });
                  },
                ),
                Text('Available'),
                Radio(
                  value: false,
                  groupValue: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value!;
                    });
                  },
                ),
                Text('Not Available'),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Dish Type:'),
            DropdownButton<String>(
              value: dishType,
              onChanged: (value) {
                setState(() {
                  dishType = value!;
                });
              },
              items: ['Main Course', 'Appetizer', 'Dessert', 'Beverage']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle saving or processing the dish details
                // For now, let's just print the details
                print('Dish ID: $dishId');
                print('Dish Name: $dishName');
                print('Price: $price');
                print('Availability: $isAvailable');
                print('Dish Type: $dishType');
                sendData(dishId, dishName);
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  DishList();
                  },
                ),
              );
              },
              child: Text('Save Dish'),
            ),
          ],
        ),
      ),
    );
  }
  void sendData(String e, String p) async {
  try {
    // Access the Firestore collection
    CollectionReference dishes = FirebaseFirestore.instance.collection('dishes');

    // Add a document to the "users" collection
    await dishes.add({
      'dishId': e,
      'dishNames': p,
    });
     print('User authenticated e: ${e}');
     print('User authenticated p: ${p}');


    print('Data added to Firestore successfully!');
  } catch (e) {
    print('Error adding data to Firestore: $e');
  }
}
}