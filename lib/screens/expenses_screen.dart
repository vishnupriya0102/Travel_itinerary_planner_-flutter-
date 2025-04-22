import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'expenses_model.dart';

class ExpensesScreen extends StatelessWidget {
  final String tripTitle;

  ExpensesScreen({required this.tripTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tripTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to a screen to add a new expense (you can create a new screen for this)
              // You can pass the tripTitle or other data if needed
            },
          ),
        ],
      ),
      body: Consumer<ExpensesModel>(
        builder: (context, model, child) {
          if (model.expenses.isEmpty) {
            return Center(child: Text('No expenses added yet.'));
          }
          return ListView.builder(
            itemCount: model.expenses.length,
            itemBuilder: (context, index) {
              String category = model.expenses.keys.elementAt(index);
              double expense = model.expenses[category] ?? 0.0;
              return ListTile(
                title: Text(category),
                trailing: Text('₹${expense.toStringAsFixed(2)}'),
                onLongPress: () {
                  // Provide option to remove expense (optional)
                  model.removeExpense(category);
                },
              );
            },
          );
        },
      ),
    );
  }
}
