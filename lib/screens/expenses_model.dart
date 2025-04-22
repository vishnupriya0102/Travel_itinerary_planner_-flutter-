import 'package:flutter/material.dart';

class ExpensesModel extends ChangeNotifier {
  Map<String, double> _expenses = {};

  Map<String, double> get expenses => _expenses;

  void addExpense(String category, double amount) {
    if (category.isEmpty || amount <= 0) {
      // You could also show a user-friendly error message
      return;
    }
    _expenses[category] = (_expenses[category] ?? 0.0) + amount;
    notifyListeners();
  }

  void removeExpense(String category) {
    if (_expenses.containsKey(category)) {
      _expenses.remove(category);
      notifyListeners();
    }
  }

  void clearAllExpenses() {
    _expenses.clear();
    notifyListeners();
  }
}
