// Controller specifically for the branch details screen
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../branches_list_screen/controller/branch_list_screen_controller.dart';
class BranchDetailsController with ChangeNotifier {
  Map<String, dynamic> _editedBranchData = {};
  bool _isEditing = false;

  // TextEditingControllers
  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController registrationNumberController = TextEditingController();
  final TextEditingController branchNumberController = TextEditingController();
  final TextEditingController employeesCountController = TextEditingController();

  // FocusNodes
  final FocusNode branchNameFocusNode = FocusNode();
  final FocusNode locationFocusNode = FocusNode();
  final FocusNode registrationNumberFocusNode = FocusNode();
  final FocusNode branchNumberFocusNode = FocusNode();
  final FocusNode employeesCountFocusNode = FocusNode();

  // ScrollController
  final ScrollController scrollController = ScrollController();

  bool get isEditing => _isEditing;
  Map<String, dynamic> get editedBranchData => _editedBranchData;

  void init(Map<String, dynamic> branchData) {
    _editedBranchData = Map.from(branchData);

    // Set the controller texts
    branchNameController.text = _editedBranchData["branchName"] ?? "";
    locationController.text = _editedBranchData["location"] ?? "";
    registrationNumberController.text = _editedBranchData["registrationNumber"] ?? "";
    branchNumberController.text = _editedBranchData["branchNumber"] ?? "";
    employeesCountController.text = _editedBranchData["employeesCount"] ?? "";

    // Set up focus node listeners
    branchNameFocusNode.addListener(_scrollToFocusedField);
    locationFocusNode.addListener(_scrollToFocusedField);
    registrationNumberFocusNode.addListener(_scrollToFocusedField);
    branchNumberFocusNode.addListener(_scrollToFocusedField);
    employeesCountFocusNode.addListener(_scrollToFocusedField);
  }

  void _scrollToFocusedField() {
    if (branchNameFocusNode.hasFocus) {
      _scrollToField(branchNameFocusNode);
    } else if (locationFocusNode.hasFocus) {
      _scrollToField(locationFocusNode);
    } else if (registrationNumberFocusNode.hasFocus) {
      _scrollToField(registrationNumberFocusNode);
    } else if (branchNumberFocusNode.hasFocus) {
      _scrollToField(branchNumberFocusNode);
    } else if (employeesCountFocusNode.hasFocus) {
      _scrollToField(employeesCountFocusNode);
    }
  }

  void _scrollToField(FocusNode focusNode) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderObject = focusNode.context?.findRenderObject() as RenderBox?;
      if (renderObject != null) {
        final offset = renderObject.localToGlobal(Offset.zero).dy;
        final scrollOffset = offset - 100; // Adjust this value as needed
        scrollController.animateTo(
          scrollOffset,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void toggleEditMode() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  void saveChanges(BuildContext context, int branchIndex) {
    // Update the edited data
    _editedBranchData["branchName"] = branchNameController.text;
    _editedBranchData["location"] = locationController.text;
    _editedBranchData["registrationNumber"] = registrationNumberController.text;
    _editedBranchData["branchNumber"] = branchNumberController.text;
    _editedBranchData["employeesCount"] = employeesCountController.text;

    // Update in the main controller
    final branchListScreenController = Provider.of<BranchListScreenController>(context, listen: false);
    branchListScreenController.updateBranch(branchIndex, _editedBranchData);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Branch updated successfully!"),
        backgroundColor: ColorTheme.accentBlue,
      ),
    );

    // Exit edit mode
    toggleEditMode();
  }

  @override
  void dispose() {
    // Dispose controllers
    branchNameController.dispose();
    locationController.dispose();
    registrationNumberController.dispose();
    branchNumberController.dispose();
    employeesCountController.dispose();

    // Dispose focus nodes
    branchNameFocusNode.dispose();
    locationFocusNode.dispose();
    registrationNumberFocusNode.dispose();
    branchNumberFocusNode.dispose();
    employeesCountFocusNode.dispose();

    // Dispose scroll controller
    scrollController.dispose();

    super.dispose();
  }
}