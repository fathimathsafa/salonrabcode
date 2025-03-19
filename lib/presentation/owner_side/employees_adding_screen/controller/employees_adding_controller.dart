import 'package:flutter/material.dart';

class EmployeesAddingController with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final employeeNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

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

  void saveEmployeeDetails(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Logic to save employee details
      showSuccessMessage(context);
    }
  }

  void showSuccessMessage(BuildContext context) {
    // Show success message logic
  }
}
