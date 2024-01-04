import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class AddDishPage extends StatefulWidget {
  const AddDishPage({Key? key}) : super(key: key);

  @override
  _AddDishPageState createState() => _AddDishPageState();
}

class _AddDishPageState extends State<AddDishPage> {
  final _formKey = GlobalKey<FormState>();
  String? _dishName;
  String? _dishPrice;
  bool _available = true;
  String? _dishType;
  String? _restaurantId;

  final CollectionReference dishCollection =
      FirebaseFirestore.instance.collection('dishes'); // Firestore collection reference

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Dish'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Dish Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a dish name.';
                  }
                  return null;
                },
                onSaved: (value) => _dishName = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Dish Price',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a dish price.';
                  }
                  return null;
                },
                onSaved: (value) => _dishPrice = value,
              ),
              Row(
                children: [
                  const Text('Available'),
                  Radio<bool>(
                    value: true,
                    groupValue: _available,
                    onChanged: (value) {
                      setState(() {
                        _available = value!;
                      });
                    },
                  ),
                  const Text('Not Available'),
                  Radio<bool>(
                    value: false,
                    groupValue: _available,
                    onChanged: (value) {
                      setState(() {
                        _available = value!;
                      });
                    },
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Dish Type',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Appetizer',
                    child: Text('Appetizer'),
                  ),
                  DropdownMenuItem(
                    value: 'Main Course',
                    child: Text('Main Course'),
                  ),
                  DropdownMenuItem(
                    value: 'Dessert',
                    child: Text('Dessert'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _dishType = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Restaurant ID',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a restaurant ID.';
                  }
                  return null;
                },
                onSaved: (value) => _restaurantId = value,
              ),
              ElevatedButton(
                onPressed: () async {

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Add dish to Firestore database
                    try {
                      CollectionReference dish = FirebaseFirestore.instance.collection('dish');
                      await dishCollection.add({
                        'name': _dishName,
                        'price': _dishPrice,
                        'avl': _available,
                        'type': _dishType,
                        'rid': _restaurantId,
                      }
                      );

                      // Reset form values after successful addition
                      _formKey.currentState!.reset();

                      // Show a success message or perform other actions
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Dish added successfully!'),
                        ),
                      );

                      // You may choose to navigate back or perform other actions
                      // Navigator.pop(context);
                    } catch (e) {
                      // If there's an error adding the dish to the database
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error adding dish: $e'),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Add Dish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddDishPage(),
  ));
void sendData(String e, String p) async {
  try {
    // Access the Firestore collection
    CollectionReference dish = FirebaseFirestore.instance.collection('dish');

    // Add a document to the "users" collection
    await dish.add({
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


/*
void sendData() async {
  try {
    // Access the Firestore collection for dishes
    CollectionReference dish = FirebaseFirestore.instance.collection('dish');

    // Add a document to the "dishes" collection with dish information
    await dish.add({
      'name': _dishName,
      'price': _dishPrice,
      'avl': _available,
      'type': _dishType,
      'rid': _restaurantId,
    });

    // Reset form values after successful addition
    _formKey.currentState!.reset();

    // Show a success message or perform other actions
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Dish added successfully!'),
      ),
    );

    print('Dish added to Firestore successfully!');
  } catch (e) {
    // If there's an error adding the dish to the database
    print('Error adding dish to Firestore: $e');
  }
}
*/



}
