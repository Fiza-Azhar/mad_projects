/*import 'package:flutter/material.dart';
import 'package:chap11_dismissle/trip.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Trip> _trips = List<Trip>();

  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  void _markTripCompleted() {
    // Mark trip completed in Database or web service
  }

  void _deleteTrip() {
    // Delete trip from Database or web service
  }

  ListTile _buildListTile(int index) {
    final trip = _trips[index];
    return ListTile(
      title: Text(trip.tripName),
      subtitle: Text(trip.tripLocation),
    );
  }

  Widget _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      alignment: Alignment.centerLeft,
      child: Icon(Icons.check),
    );
  }

  Widget _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      child: Icon(Icons.delete),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible Example'),
      ),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(_trips[index].id),
            child: _buildListTile(index),
            background: _buildCompleteTrip(),
            secondaryBackground: _buildRemoveTrip(),
            onDismissed: (DismissDirection direction) {
              direction == DismissDirection.startToEnd
                  ? _markTripCompleted()
                  : _deleteTrip();
              setState(() {
                _trips.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
*/