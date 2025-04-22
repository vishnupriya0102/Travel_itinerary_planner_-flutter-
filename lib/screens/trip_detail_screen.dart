import 'package:flutter/material.dart';
import '../models/trip.dart';
import 'expenses_screen.dart';
import 'packing_checklist_screen.dart';

class TripDetailScreen extends StatelessWidget {
  final Trip trip;

  TripDetailScreen({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Destination: ${trip.destination}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Start: ${trip.startDate.toLocal()}".split(' ')[0]),
            Text("End: ${trip.endDate.toLocal()}".split(' ')[0]),
            Text("Budget: ₹${trip.budget.toStringAsFixed(2)}"),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.checklist),
              label: Text('Packing Checklist'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PackingChecklistScreen(tripTitle: trip.title),
                  ),
                );
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.attach_money),
              label: Text('Track Expenses'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExpensesScreen(tripTitle: trip.title),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
