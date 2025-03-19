import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

class EmployeeDetailsController with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  // Public getter for _formKey
  GlobalKey<FormState> get formKey => _formKey;

  // Controllers for text fields
  final employeeNameController = TextEditingController(text: "Arun");
  final userNameController = TextEditingController(text: "112014");
  final passwordController = TextEditingController(text: "arunasdf");

  int _currentField = -1;

  int get currentField => _currentField;

  // Focus nodes for each field
  final List<FocusNode> focusNodes = List.generate(2, (index) => FocusNode());

  void setCurrentField(int index) {
    _currentField = index;
    notifyListeners();
  }

  void saveField(BuildContext context, int index) {
    if (_formKey.currentState!.validate()) {
      _currentField = -1; // Reset the current field
      focusNodes[index].unfocus(); // Un focus the current field
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
              Text(
                "Success!",
                style: GlobalTextStyles.appBarHeading(context),
              ),
              const SizedBox(height: 12),
              Text("Your service details has been successfully changed",
                  textAlign: TextAlign.center,
                  style: GlobalTextStyles.hintAndCategoryText(context)),
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
    employeeNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();

    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
