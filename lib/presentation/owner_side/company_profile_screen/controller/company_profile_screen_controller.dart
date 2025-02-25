import 'package:flutter/material.dart';

class CompanyProfileScreenController with ChangeNotifier{
  String companyName = "Hair Cut";
  String companyRegistrationNumber = "Hair";
    String companyLocation = "500";
     String numberOfOwners = "500";
          String numberOfBranch = "500";
          String mainBranch = "500";
                    String numberOfEmployee = "500";


  int? editingFieldIndex;
 int? expandedIndex; 
   void updateField(int index, String value) {
    if (index == 0) {
      companyName = value;
    } else if (index == 1) {
      companyRegistrationNumber = value;
    } else if (index == 2) {
      companyLocation = value;
    } else if (index == 2) {
      numberOfOwners = value;
    } else if (index == 2) {
      numberOfBranch = value;
    } else if (index == 2) {
      mainBranch = value;
    }  else if (index == 2) {
      numberOfEmployee = value;
    } 
    notifyListeners();
  }

}