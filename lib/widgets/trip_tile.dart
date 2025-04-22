import 'package:flutter/material.dart';
import '../models/trip.dart'; // Assuming you have a Trip model

class TripTile extends StatelessWidget {
  final Trip trip;
  final VoidCallback onTap;

  TripTile({required this.trip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(trip.title),
      subtitle: Text('Destination: ${trip.destination}'),
      onTap: onTap,
    );
  }
}
