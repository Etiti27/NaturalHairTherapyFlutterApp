import 'package:flutter/material.dart';

class ProviderClass with ChangeNotifier {
  String _country = "";
  String _dateOfBirth = "";
  String? nutritionAnswer1;
  String? nutritionAnswer2;
  List<String> selectedIngredients = [];
  String? harmfulIngredientAnswer;

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

  void updateNutritionAnswer1(String? answer) {
    nutritionAnswer1 = answer;
    notifyListeners();
  }

  void updateNutritionAnswer2(String? answer) {
    nutritionAnswer2 = answer;
    notifyListeners();
  }

  void toggleIngredientSelection(String ingredient, bool isSelected) {
    if (isSelected) {
      selectedIngredients.add(ingredient);
    } else {
      selectedIngredients.remove(ingredient);
    }
    notifyListeners();
  }

  void updateHarmfulIngredientAnswer(String? answer) {
    harmfulIngredientAnswer = answer;
    notifyListeners();
  }
}
