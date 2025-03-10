import 'package:flutter/material.dart';

class PartnersAddingController with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final _partnerNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get partnerNameController => _partnerNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void savePartner(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Here you would add logic to save the partner data to your database

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Partner saved successfully!')),
      );
    }
  }

  void saveAndAddNew(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Here you would add logic to save the partner data to your database

      // Clear all form fields
      _partnerNameController.clear();
      _emailController.clear();
      _usernameController.clear();
      _passwordController.clear();

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Partner saved! Add another partner.')),
      );
    }
  }

  @override
  void dispose() {
    _partnerNameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}