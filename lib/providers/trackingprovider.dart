import 'package:flutter/material.dart';

class TrackingProvider with ChangeNotifier {
  final Map<DateTime, bool> _completedDates = {};

  bool isHabitCompleted(DateTime date) {
    return _completedDates[date] ?? false;
  }

  void toggleHabitCompletion(DateTime date) {
    _completedDates[date] = !(_completedDates[date] ?? false);
    notifyListeners();
  }
}
