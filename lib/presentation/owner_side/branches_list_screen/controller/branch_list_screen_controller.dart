import 'package:flutter/material.dart';

class BranchListScreenController with ChangeNotifier {
  List<Map<String, String>> _subBranches = [
    {"branchName": "CABELLLO", "location": "LOCATION"},
    {"branchName": "CABELLLO", "location": "LOCATION"},
    {"branchName": "CABELLLO", "location": "LOCATION"},
  ];

  List<Map<String, String>> get subBranches => _subBranches;

  // Delete a branch
  void deleteBranch(int index) {
    _subBranches.removeAt(index);
    notifyListeners();  // Notify listeners to update the UI
  }
}
