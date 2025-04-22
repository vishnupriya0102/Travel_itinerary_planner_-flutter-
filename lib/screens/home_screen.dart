import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/trip_model.dart';
import '../widgets/trip_tile.dart';
import 'add_trip_screen.dart';
import 'trip_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TripModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Your Trips'),
          ),
          body: model.trips.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No trips added yet!'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddTripScreen(),
                            ),
                          );
                        },
                        child: Text('Add a New Trip'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: model.trips.length,
                  itemBuilder: (context, index) {
                    final trip = model.trips[index];
                    return TripTile(
                      trip: trip,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TripDetailScreen(trip: trip),
                          ),
                        );
                      },
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddTripScreen()),
              );
            },
          ),
        );
      },
    );
  }
}
