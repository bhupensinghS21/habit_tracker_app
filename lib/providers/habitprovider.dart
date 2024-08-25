import 'package:flutter/material.dart';
import '../model/habit_model.dart';

class HabitProvider extends ChangeNotifier {
  List<Habit> _habitList = [
    Habit(
      isCompleted: false,
      title: "Drink Water",
      description: "Drink At Least 8 Cups Of Water",
      icon: const Icon(Icons.local_drink),
    ),
    Habit(
      isCompleted: false,
      title: "Read",
      description: "Read at least 25 pages",
      icon: const Icon(Icons.book),
    ),
    Habit(
      isCompleted: false,
      title: "Exercise",
      description: "Go to the gym or do cardio",
      icon: const Icon(Icons.sports_gymnastics),
    ),
    Habit(
      isCompleted: false,
      title: "Learn English",
      description: "Study English for 20 min",
      icon: const Icon(Icons.language),
    ),
    Habit(
      isCompleted: false,
      title: "Code",
      description: "Work on coding project",
      icon: const Icon(Icons.computer),
    ),
    Habit(
      isCompleted: false,
      title: "Journal",
      description: "Write Down 3 things that you appreciate",
      icon: const Icon(Icons.edit),
    ),
  ];

  int _counter = 0;

  List<Habit> get habits => _habitList;

  int get counter => _counter;

  void toggleHabit(int index, bool value) {
    _habitList[index].isCompleted = value;
    _counter = value ? _counter + 1 : _counter - 1;
    notifyListeners();
  }

  void addHabit(String title, String description) {
    _habitList.add(
      Habit(
        isCompleted: false,
        title: title,
        description: description,
        icon: const Icon(Icons.star), // Default icon for new habits
      ),
    );
    notifyListeners();
  }
}
