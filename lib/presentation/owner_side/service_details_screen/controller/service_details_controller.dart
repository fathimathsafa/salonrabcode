import 'package:flutter/material.dart';

class ServiceDetailsScreenController with ChangeNotifier{
  String serviceName = "Hair Cut";
  String category = "Hair";
    String price = "500";
  int? editingFieldIndex;
 int? expandedIndex; 
   void updateField(int index, String value) {
    if (index == 0) {
      serviceName = value;
    } else if (index == 1) {
      category = value;
    } else if (index == 2) {
      price = value;
    } 
    notifyListeners();
  }

}