import 'package:flutter/material.dart';

class BranchListScreenController with ChangeNotifier {
  List<Map<String, dynamic>> _subBranches = [];

  List<Map<String, dynamic>> get subBranches => _subBranches;

  // Delete a branch
  void deleteBranch(int index) {
    _subBranches.removeAt(index);
    notifyListeners();
  }

  // Add a new branch
  void addBranch(Map<String, dynamic> branchData) {
    _subBranches.add(branchData);
    notifyListeners();
  }
}
