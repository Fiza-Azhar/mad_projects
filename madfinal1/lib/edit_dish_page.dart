import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class EditDishScreen extends StatefulWidget {
  final Map<String, dynamic> dishDetails;

  EditDishScreen({required this.dishDetails});

  @override
  _EditDishScreenState createState() => _EditDishScreenState();
}

class _EditDishScreenState extends State<EditDishScreen> {
  TextEditingController dishNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dishNameController.text = widget.dishDetails['dishNames'];
    priceController.text = widget.dishDetails['price'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Dish'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dish ID: ${widget.dishDetails['dishId']}'),
            TextField(
              controller: dishNameController,
              decoration: InputDecoration(labelText: 'Dish Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle updating the dish details in Firestore
                updateDishDetails();
              },
              child: Text('Update Dish'),
            ),
          ],
        ),
      ),
    );
  }

  void updateDishDetails() {
    // Implement the logic to update the dish details in Firestore
    // You can use FirebaseFirestore.instance.collection('dishes').doc(widget.dishDetails['dishId']).update({...});
    print('Updated Dish Name: ${dishNameController.text}');
    print('Updated Price: ${priceController.text}');
    // You may want to navigate back to the previous screen after updating
    Navigator.pop(context);
  }
}