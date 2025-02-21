import 'package:flutter/material.dart';

class ProviderClass with ChangeNotifier {
  Map<String, String> answers = {};
  String _country = "";
  String _dateOfBirth = "";
  String? _currentUsername;
  String? _email;
  String? _hairGrowthAnswer1;
  String? _hairGrowthAnswer2;
  String? _hairGrowthAnswer3;
  String? _hairGrowthAnswer4;
  String? _hairGrowthAnswer5;
  String? _hairGrowthAnswer6;
  String? _hairGrowthAnswer7;
  String? _hairGrowthAnswer8;
  String? _hairGrowthAnswer9;
  List<String> selectedIngredients = [];
  String? harmfulIngredientAnswer;
  String? _response;
  double _progress = 0.0;
  // int _currentIndex = 0;

  int _currentPage = 1;
  int _totalPage = 9;

  String? getCurrentUsername() {
    return _currentUsername;
  }

  void updateCurrentUsername(String newValue) {
    _currentUsername = newValue;
    notifyListeners();
  }

  String? getEmail() {
    return _email;
  }

  void updateEmail(String newValue) {
    _email = newValue;
    notifyListeners();
  }

  double getProgress() {
    return _progress;
  }

  String? getResponse() {
    return _response;
  }

  void updateResponse(String newResponse) {
    _response = newResponse;
    notifyListeners();
  }

  int getCurrentPage() {
    return _currentPage;
  }

  int getTotalPage() {
    return _totalPage;
  }

  void updateProgressBck(int totalPages) {
    _currentPage--;
    _progress = (_currentPage / _totalPage).clamp(0.0, 1.0);
    notifyListeners();
  }

  void updateProgress(int totalPages) {
    _currentPage++;
    _progress = (_currentPage / _totalPage).clamp(0.0, 1.0);
    notifyListeners();
  }

  void resetProgress() {
    _currentPage = 0;
    _progress = 0.0;
    notifyListeners();
  }

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

  void updateNutritionAnswer1(String answer) {
    _hairGrowthAnswer1 = answer;
    notifyListeners();
  }

  String? getHairGrowthAnswer1() {
    return _hairGrowthAnswer1;
  }

  String? getHairGrowthAnswer2() {
    return _hairGrowthAnswer2;
  }

  String? getHairGrowthAnswer3() {
    return _hairGrowthAnswer3;
  }

  String? getHairGrowthAnswer4() {
    return _hairGrowthAnswer4;
  }

  String? getHairGrowthAnswer5() {
    return _hairGrowthAnswer5;
  }

  String? getHairGrowthAnswer6() {
    return _hairGrowthAnswer6;
  }

  String? getHairGrowthAnswer7() {
    return _hairGrowthAnswer7;
  }

  String? getHairGrowthAnswer8() {
    return _hairGrowthAnswer8;
  }

  String? getHairGrowthAnswer9() {
    return _hairGrowthAnswer9;
  }

  void updateHairGrowthAnswer2(String? answer) {
    _hairGrowthAnswer2 = answer;
    notifyListeners();
  }

  void updateHairGrowthAnswer3(String? answer) {
    _hairGrowthAnswer3 = answer;
    notifyListeners();
  }

  void updateHairGrowthAnswer4(String? answer) {
    _hairGrowthAnswer4 = answer;
    notifyListeners();
  }

  void updateHairGrowthAnswer5(String? answer) {
    _hairGrowthAnswer5 = answer;
    notifyListeners();
  }

  void updateHairGrowthAnswer6(String? answer) {
    _hairGrowthAnswer6 = answer;
    notifyListeners();
  }

  void updateHairGrowthAnswer7(String? answer) {
    _hairGrowthAnswer7 = answer;
    notifyListeners();
  }

  void updateHairGrowthAnswer8(String? answer) {
    _hairGrowthAnswer8 = answer;
    notifyListeners();
  }

  void updateHairGrowthAnswer9(String? answer) {
    _hairGrowthAnswer9 = answer;
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
