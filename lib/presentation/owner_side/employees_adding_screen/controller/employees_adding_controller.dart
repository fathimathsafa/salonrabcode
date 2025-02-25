import 'package:flutter/material.dart';

class SelectedServiceProvider extends ChangeNotifier {
  List<Map<String, String>> selectedServices = [];

  void selectService(Map<String, String> service) {
    // ✅ Only add if it's not already in the list
    if (!selectedServices.any((s) => s['name'] == service['name'])) {
      selectedServices.add(service);
      notifyListeners();
    }
  }
}
