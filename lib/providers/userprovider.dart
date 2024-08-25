import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _imagePath;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get imagePath => _imagePath;

  void setFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void setLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }
}
