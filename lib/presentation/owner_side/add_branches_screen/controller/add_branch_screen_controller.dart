import 'package:flutter/material.dart';

class AddBranchesController with ChangeNotifier {
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController branchLocationController =
      TextEditingController();
  final TextEditingController registrationNumberController =
      TextEditingController();
  final TextEditingController branchNumberController = TextEditingController();
  final TextEditingController employeesCountController =
      TextEditingController();

  // Get all branch data as a Map
  Map<String, dynamic> getBranchData() {
    return {
      "branchName": branchNameController.text,
      "location": branchLocationController.text,
      "registrationNumber": registrationNumberController.text,
      "branchNumber": branchNumberController.text,
      "employeesCount": employeesCountController.text,
    };
  }

  // Clear all fields
  void clearFields() {
    branchNameController.clear();
    branchLocationController.clear();
    registrationNumberController.clear();
    branchNumberController.clear();
    employeesCountController.clear();
  }

  // Check if all required fields are filled
  bool areFieldsValid() {
    return branchNameController.text.isNotEmpty &&
        branchLocationController.text.isNotEmpty &&
        registrationNumberController.text.isNotEmpty &&
        branchNumberController.text.isNotEmpty &&
        employeesCountController.text.isNotEmpty;
  }

  @override
  void dispose() {
    branchNameController.dispose();
    branchLocationController.dispose();
    registrationNumberController.dispose();
    branchNumberController.dispose();
    employeesCountController.dispose();
    super.dispose();
  }
}
