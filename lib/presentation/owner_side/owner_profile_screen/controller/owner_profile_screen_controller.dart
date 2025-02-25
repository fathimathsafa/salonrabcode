import 'package:flutter/material.dart';

class OwnerProfileScreenController with ChangeNotifier{
  String ownerName = "Hair Cut";
  String phoneNumber = "Hair";
    String email = "500";
     String aadharNumber = "500";
  int? editingFieldIndex;
 int? expandedIndex; 
   void updateField(int index, String value) {
    if (index == 0) {
      ownerName = value;
    } else if (index == 1) {
      phoneNumber = value;
    } else if (index == 2) {
      email = value;
    } else if (index == 2) {
      aadharNumber = value;
    } 
    notifyListeners();
  }

}