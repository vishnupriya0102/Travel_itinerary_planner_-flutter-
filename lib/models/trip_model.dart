import 'package:scoped_model/scoped_model.dart';
import 'trip.dart';

class TripModel extends Model {
  List<Trip> _trips = [];

  List<Trip> get trips => _trips;

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners(); // Notify listeners about changes
  }
}
