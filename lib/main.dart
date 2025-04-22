import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';  // If you're using Firebase Auth
import 'package:travel_itinerary_planner_app/screens/home_screen.dart';
import 'package:travel_itinerary_planner_app/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';  // ScopedModel import
import 'models/trip_model.dart'; // Import the TripModel

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with the necessary options
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBlzwQ1lZSFSiGm37zETzyGKgSQmRItsWI",
      authDomain: "travelitneraryplanner.firebaseapp.com",
      projectId: "travelitneraryplanner",
      storageBucket: "travelitneraryplanner.firebasestorage.app",
      messagingSenderId: "280063500802",
      appId: "1:280063500802:web:a95d9a79a2525618197d1b",
      measurementId: "G-5KRWN8YBFH" // Optional, if you use Analytics
    ),
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<TripModel>(
      model: TripModel(), // Initialize your model
      child: MaterialApp(
        title: 'Travel Itinerary Planner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),  // Set LoginScreen as the initial screen
      ),
    );
  }
}
