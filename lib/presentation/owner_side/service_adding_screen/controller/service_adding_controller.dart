import 'package:flutter/material.dart';

class AddServiceController with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final _serviceNameController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedCategory = 'Hair';
  String _selectedGender = 'All';

  final List<String> _categories = [
    'Hair',
    'Facial',
    'Nails',
    'Massage',
    'Makeup',
    'Spa',
  ];

  final List<String> _genders = ['All', 'Women', 'Men', 'Children'];

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get serviceNameController => _serviceNameController;
  TextEditingController get priceController => _priceController;
  String get selectedCategory => _selectedCategory;
  String get selectedGender => _selectedGender;
  List<String> get categories => _categories;
  List<String> get genders => _genders;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSelectedGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void saveService(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Service saved successfully!')),
      );
    }
  }

  void saveAndAddNew(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _serviceNameController.clear();
      _priceController.clear();
      _selectedCategory = 'Hair';
      _selectedGender = 'All';
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Service saved! Add another service.')),
      );
    }
  }

  @override
  void dispose() {
    _serviceNameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}