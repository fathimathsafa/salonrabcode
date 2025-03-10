import 'dart:async'; // Import the Timer class
import 'package:flutter/material.dart';

class CompanyProfileScreenController with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  // Public getter for _formKey
  GlobalKey<FormState> get formKey => _formKey;

  // Controllers for text fields
  final nameController = TextEditingController(text: "RABLOON");
  final regNumberController = TextEditingController(text: "112014");
  final locationController = TextEditingController(text: "KOCHI");
  final ownersController = TextEditingController(text: "3");
  final branchesController = TextEditingController(text: "2");
  final mainBranchController = TextEditingController(text: "KOCHI");
  final employeesController = TextEditingController(text: "10");

  int _currentField = -1;

  int get currentField => _currentField;

  void setCurrentField(int index) {
    _currentField = index;
    notifyListeners();
  }

  void saveField(BuildContext context, int index) {
    if (_formKey.currentState!.validate()) {
      _currentField = -1; // Reset the current field
      notifyListeners();
      showSuccessMessage(context);
    }
  }

  void showSuccessMessage(BuildContext context) {
    // Show the dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1C2E4A),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(
              color: const Color(0xFF4D9DE0).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4D9DE0).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFF7EDFFF),
                  size: 60,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Success!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Your business information has been successfully saved",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Automatically close the dialog after 2 seconds
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    regNumberController.dispose();
    locationController.dispose();
    ownersController.dispose();
    branchesController.dispose();
    mainBranchController.dispose();
    employeesController.dispose();
    super.dispose();
  }
}