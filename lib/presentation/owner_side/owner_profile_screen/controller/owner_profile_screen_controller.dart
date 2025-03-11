import 'dart:async';
import 'package:flutter/material.dart';

class OwnerProfileScreenController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  // Public getter for formKey

  // Controllers for text fields
  final nameController = TextEditingController(text: "Hair Cut");
  final phoneController = TextEditingController(text: "Hair");
  final emailController = TextEditingController(text: "500");
  final aadharController = TextEditingController(text: "500");

  int _currentField = -1;

  int get currentField => _currentField;

  void setCurrentField(int index) {
    _currentField = index;
    notifyListeners();
  }

  void saveField(BuildContext context, int index) {
    if (formKey.currentState!.validate()) {
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
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Your profile information has been successfully saved",
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

    // Automatically close the dialog after 1 second
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    aadharController.dispose();
    super.dispose();
  }
}