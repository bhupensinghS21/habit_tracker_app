import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners(); // Notify all listeners about the locale change
    }
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
