import 'package:flutter/material.dart';

class AddServiceEmployeeEditingScreenController with ChangeNotifier {
  List<Map<String, String>> selectedServices = [];
  void selectService(Map<String, String> service) {
    if (!selectedServices.any((s) => s['name'] == service['name'])) {
      selectedServices.add(service);
      notifyListeners();
    }
  }

  void removeService(Map<String, String> service) {
    selectedServices.removeWhere((s) => s['name'] == service['name']);
    notifyListeners();
  }
}
