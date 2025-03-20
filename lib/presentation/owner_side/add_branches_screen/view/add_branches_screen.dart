import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/branches_list_screen/controller/branch_list_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/branches_list_screen/view/branches_list_screen.dart';
import '../../../../core/common/painters/background_painter.dart';
import '../../company_profile_screen/view/company_profile_screen.dart';
import '../controller/add_branch_screen_controller.dart';

class AddBranchesScreen extends StatefulWidget {
  const AddBranchesScreen({super.key});

  @override
  State<AddBranchesScreen> createState() => _AddBranchesScreenState();
}

class _AddBranchesScreenState extends State<AddBranchesScreen> {
  final ScrollController _scrollController = ScrollController();

  // Define FocusNodes for each field
  final FocusNode _branchNameFocusNode = FocusNode();
  final FocusNode _branchLocationFocusNode = FocusNode();
  final FocusNode _registrationNumberFocusNode = FocusNode();
  final FocusNode _branchNumberFocusNode = FocusNode();
  final FocusNode _employeesCountFocusNode = FocusNode();

  @override
  void dispose() {
    _scrollController.dispose();
    _branchNameFocusNode.dispose();
    _branchLocationFocusNode.dispose();
    _registrationNumberFocusNode.dispose();
    _branchNumberFocusNode.dispose();
    _employeesCountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;

    // Get the controllers
    final addBranchesController = Provider.of<AddBranchesController>(context);
    final branchListController =
    Provider.of<BranchListScreenController>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.darkBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorTheme.highlightBlue,
            size: isMobile ? 20.sp : (isTablet ? 16.sp : 8.sp),
          ),
        ),
        title: Text(
          "RABLOON",
          style: TextStyle(
            color: ColorTheme.highlightBlue,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 20.sp : (isTablet ? 16.sp : 12.sp),
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Tooltip(
              message: "You need to fill all the fields to add your branch.",
              child: Icon(
                Icons.help_outline,
                color: ColorTheme.highlightBlue,
              ),
              textStyle:GlobalTextStyles.hintAndCategoryText(
          context),
            ),
            onPressed: () {
              // Optional
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background decoration
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: ColorTheme.accentBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.business,
                            color: ColorTheme.highlightBlue,
                            size: isMobile ? 24.sp : 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "Branch Information",
                              style: GlobalTextStyles.subHeading(
                                  context)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    _buildFormSection(
                      context,
                      title: "Branch Details",
                      icon: Icons.store,
                      fields: [
                        _buildFormField(
                          context,
                          label: "Branch Name",
                          hint: "Enter your branch name",
                          icon: Icons.business_center,
                          controller: addBranchesController.branchNameController,
                          currentFocusNode: _branchNameFocusNode,
                          nextFocusNode: _branchLocationFocusNode,
                        ),
                        _buildFormField(
                          context,
                          label: "Branch Location",
                          hint: "Enter your branch location",
                          icon: Icons.location_on,
                          controller: addBranchesController.branchLocationController,
                          currentFocusNode: _branchLocationFocusNode,
                          nextFocusNode: _registrationNumberFocusNode,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    _buildFormSection(
                      context,
                      title: "Registration Information",
                      icon: Icons.description,
                      fields: [
                        _buildFormField(
                          context,
                          label: "Company Registration Number",
                          hint: "Enter company registration number",
                          icon: Icons.numbers,
                          controller: addBranchesController.registrationNumberController,
                          currentFocusNode: _registrationNumberFocusNode,
                          nextFocusNode: _branchNumberFocusNode,
                        ),
                        _buildFormField(
                          context,
                          label: "Branch Number",
                          hint: "Enter branch number",
                          icon: Icons.tag,
                          controller: addBranchesController.branchNumberController,
                          currentFocusNode: _branchNumberFocusNode,
                          nextFocusNode: _employeesCountFocusNode,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    _buildFormSection(
                      context,
                      title: "Staffing",
                      icon: Icons.people,
                      fields: [
                        _buildFormField(
                          context,
                          label: "Number of Employees",
                          hint: "Enter number of employees",
                          icon: Icons.person_add,
                          controller: addBranchesController.employeesCountController,
                          currentFocusNode: _employeesCountFocusNode,
                          isLastField: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 90.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorTheme.darkBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            // SAVE & NEW Button
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorTheme.accentBlue,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    if (addBranchesController.areFieldsValid()) {
                      Map<String, dynamic> branchData =
                      addBranchesController.getBranchData();
                      branchListController.addBranch(branchData);
                      addBranchesController.clearFields();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Branch added successfully!"),
                          backgroundColor: ColorTheme.accentBlue,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please fill all fields!"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: ColorTheme.highlightBlue,
                    size: 20.sp,
                  ),
                  label: Text(
                    "SAVE & NEW",
                    style: TextStyle(
                      color: ColorTheme.highlightBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12.sp,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            // SAVE Button
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorTheme.accentBlue,
                      ColorTheme.highlightBlue,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme.accentBlue.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (addBranchesController.areFieldsValid()) {
                      Map<String, dynamic> branchData =
                      addBranchesController.getBranchData();
                      branchListController.addBranch(branchData);
                      addBranchesController.clearFields();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => BranchesListScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please fill all fields!"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  label: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection(
      BuildContext context, {
        required String title,
        required IconData icon,
        required List<Widget> fields,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.mediumBlue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: ColorTheme.accentBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: ColorTheme.highlightBlue,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: GlobalTextStyles.subHeading(
                    context)
                ),
              ],
            ),
          ),
          Divider(height: 1, color: ColorTheme.accentBlue.withOpacity(0.2)),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: fields,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
      BuildContext context, {
        required String label,
        required String hint,
        required IconData icon,
        required TextEditingController controller,
        FocusNode? currentFocusNode,
        FocusNode? nextFocusNode,
        bool isLastField = false,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16.sp,
                color: Colors.white70,
              ),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorTheme.mediumBlue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: ColorTheme.accentBlue.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Icon(
                  icon,
                  color: ColorTheme.highlightBlue.withOpacity(0.7),
                  size: 20.sp,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  focusNode: currentFocusNode,
                  textInputAction: isLastField ? TextInputAction.done : TextInputAction.next,
                  onFieldSubmitted: (value) {
                    if (nextFocusNode != null) {
                      nextFocusNode.requestFocus();
                    }
                    if (!isLastField) {
                      _scrollController.animateTo(
                        _scrollController.offset + 100,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: GlobalTextStyles.textFormfieldStyle(context),
                  decoration: InputDecoration(
                    hintText: hint,
                    filled: true,
                    fillColor: Colors.blueGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: ColorTheme.maincolor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: ColorTheme.white.withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: ColorTheme.white, width: 2),
                    ),
                    hintStyle: GlobalTextStyles.hintStyle(context).copyWith(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}