import 'package:madfinal1/add_dish_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dish List'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // Handle the action when the back button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddDishPage()),
            );
          },
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('dishes').get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No dishes found.'));
          }

          var dishes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: dishes.length,
            itemBuilder: (context, index) {
              var dish = dishes[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  child: Text(''),
                ),
                title: Text('Dish Name: ${dish['dishNames']}'),
                subtitle: Text('Dish Id: ${dish['dishId']}'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Navigate to the edit screen and pass the dish details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDishScreen(dishDetails: dish),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

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
    priceController.text = widget.dishDetails['dishId'].toString();
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
            TextField(
              controller: dishNameController,
              decoration: InputDecoration(labelText: 'Dish Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Dish Id'),
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

  void updateDishDetails() async {
    try {
      String dishId = widget.dishDetails['dishNames'];

      // Check if the document exists
      DocumentSnapshot dishSnapshot = await FirebaseFirestore.instance
          .collection('dishes')
          .doc(dishId)
          .get();

      if (dishSnapshot.exists) {
        // Document exists, update the dish details
        await FirebaseFirestore.instance
            .collection('dishes')
            .doc(dishId)
            .update({
          'dishNames': dishNameController.text,
          // Add more fields if needed
        });

        print('Dish details updated successfully!');
        // You may want to navigate back to the previous screen after updating
        Navigator.pop(context);
      } else {
        // Document does not exist, handle accordingly (create new document or show an error message)
        print('Document with dishId $dishId does not exist.');
      }
    } catch (e) {
      print('Error updating dish details: $e');
      // Handle the error as needed
    }
  }
}