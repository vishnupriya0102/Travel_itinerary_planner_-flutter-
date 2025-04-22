import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/trip_model.dart';
import '../models/trip.dart';

class AddTripScreen extends StatefulWidget {
  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _destinationController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  double _budget = 0.0;

  void _submit() {
    if (_formKey.currentState!.validate() &&
        _startDate != null &&
        _endDate != null &&
        _budget > 0) {
      final trip = Trip(
        title: _titleController.text,
        destination: _destinationController.text,
        startDate: _startDate!,
        endDate: _endDate!,
        budget: _budget,
      );

      // Access TripModel using ScopedModel and add the trip
      ScopedModel.of<TripModel>(context).addTrip(trip);
      Navigator.pop(context);
    }
  }

  Future<void> _pickDate(bool isStart) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Trip')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Trip Title'),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
              ),
              TextFormField(
                controller: _destinationController,
                decoration: InputDecoration(labelText: 'Destination'),
                validator: (value) =>
                    value!.isEmpty ? 'Enter destination' : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => _pickDate(true),
                      child: Text(_startDate == null
                          ? 'Select Start Date'
                          : 'Start: ${_startDate!.toLocal()}'.split(' ')[0]),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () => _pickDate(false),
                      child: Text(_endDate == null
                          ? 'Select End Date'
                          : 'End: ${_endDate!.toLocal()}'.split(' ')[0]),
                    ),
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Budget'),
                onChanged: (value) =>
                    _budget = double.tryParse(value) ?? 0.0,
                validator: (value) => value!.isEmpty || _budget <= 0
                    ? 'Enter a valid budget'
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: Text('Add Trip')),
            ],
          ),
        ),
      ),
    );
  }
}
