import 'package:flutter/material.dart';

import '../../owner_registration_screen/view/owner_registration_screen.dart';

class CompanyRegistrationController extends ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _fields = [
    "Company Name",
    "Company Address",
    "Company Location",
    "Registration Number",
    "Number of Owners",
    "Number of Branches"
  ];

  final List<IconData> _icons = [
    Icons.business_center,
    Icons.location_on,
    Icons.map,
    Icons.numbers,
    Icons.people,
    Icons.account_tree
  ];

  final Map<String, String> _answers = {};
  final Map<String, String> _errors = {};

  // Getters
  PageController get pageController => _pageController;
  int get currentPage => _currentPage;
  List<String> get fields => _fields;
  List<IconData> get icons => _icons;
  Map<String, String> get answers => _answers;
  Map<String, String> get errors => _errors;

  // Methods
  void nextPage() {
    if (_currentPage < _fields.length) {
      String currentField = _fields[_currentPage];
      if (_answers[currentField] == null || _answers[currentField]!.isEmpty) {
        _errors[currentField] = "This field is required";
        notifyListeners();
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _currentPage++;
        notifyListeners();
      }
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _currentPage--;
      notifyListeners();
    }
  }

  void updateAnswer(String field, String value) {
    _answers[field] = value;
    _errors.remove(field);
    notifyListeners();
  }

  void submit(BuildContext context) {
    if (_currentPage == _fields.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OwnerRegistrationScreen()),
      );
    }
  }

  // New method to update the current page
  void updateCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}