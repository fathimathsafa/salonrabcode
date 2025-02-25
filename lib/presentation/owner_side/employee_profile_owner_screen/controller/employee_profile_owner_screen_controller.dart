import 'package:flutter/material.dart';

class EmployeeProfileScreenController with ChangeNotifier {
  String employeeName = "John";
  String username = "john123";
  String password = "500345";
  int? editingFieldIndex;
  int? expandedIndex; // ✅ Tracks expanded customer for bottom sheet

  // ✅ Update employee details
  void updateField(int index, String value) {
    if (index == 0) {
      employeeName = value;
    } else if (index == 1) {
      username = value;
    } else if (index == 2) {
      password = value;
    }
    notifyListeners();
  }

  // ✅ List to store "Today's Work"
  List<Map<String, dynamic>> todaysWork = [
    {
      "customerName": "Customer 1",
      "customerID": "CUST001",
      "services": [
        {"name": "Haircut", "price": 500, "discount": 10},
        {"name": "Shaving", "price": 300, "discount": 5}
      ]
    },
    {
      "customerName": "Customer 2",
      "customerID": "CUST002",
      "services": [
        {"name": "Facial", "price": 700, "discount": 15}
      ]
    },
    {
      "customerName": "Customer 3",
      "customerID": "CUST003",
      "services": []
    },
  ];

  // ✅ Remove work item
  void removeWork(int index) {
    todaysWork.removeAt(index);
    notifyListeners();
  }

  // ✅ Expand/collapse bottom sheet
  void toggleExpandedIndex(int index) {
    expandedIndex = (expandedIndex == index) ? null : index;
    notifyListeners();
  }
}
