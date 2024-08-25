import 'package:flutter/material.dart';

class Habit {
  bool isCompleted;
  String title;
  String description;
  Icon icon;

  Habit({
    required this.isCompleted,
    required this.title,
    required this.description,
    required this.icon,
  });
}
