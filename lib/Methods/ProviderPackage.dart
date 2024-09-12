import 'package:flutter/material.dart';

class ProviderClass with ChangeNotifier {
  String _country = "";
  String _dateOfBirth = "";

  String getCountry() {
    return _country;
  }

  void setCountry(String newCountry) {
    _country = newCountry;
    notifyListeners();
  }

  String getDateOfBirth() {
    return _dateOfBirth;
  }

  void setDateOfBirth(String myDate) {
    _dateOfBirth = myDate;
    notifyListeners();
  }

  void clearDateOfBirth() {
    _dateOfBirth = "";
    notifyListeners();
  }

  void clearCountrySelected() {
    _country = "";
    notifyListeners();
  }
}
