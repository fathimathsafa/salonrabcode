import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/branches_list_screen/controller/branch_list_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/branches_list_screen/view/branches_list_screen.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_textformfield.dart';

import '../../../../core/common/painters/background_painter.dart';
import '../controller/add_branch_screen_controller.dart';

class AddBranchesScreen extends StatelessWidget {
  const AddBranchesScreen({super.key});

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
            color: Colors.white,
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
                color: Colors.white,
              ),
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
              painter: BackgroundPainter(
                darkBlue: ColorTheme.darkBlue,
                mediumBlue: ColorTheme.mediumBlue,
                lightBlue: ColorTheme.lightBlue,
                accentBlue: ColorTheme.accentBlue,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
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
                            style: TextStyle(
                              color: ColorTheme.highlightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 18.sp : 14.sp,
                            ),
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
                          controller:
                              addBranchesController.branchNameController,
                          mediumBlue: ColorTheme.mediumBlue,
                          accentBlue: ColorTheme.accentBlue,
                          highlightBlue: ColorTheme.highlightBlue,
                        ),
                        _buildFormField(
                          context,
                          label: "Branch Location",
                          hint: "Enter your branch location",
                          icon: Icons.location_on,
                          controller:
                              addBranchesController.branchLocationController,
                          mediumBlue: ColorTheme.mediumBlue,
                          accentBlue: ColorTheme.accentBlue,
                          highlightBlue: ColorTheme.highlightBlue,
                        ),
                      ],
                      mediumBlue: ColorTheme.mediumBlue,
                      accentBlue: ColorTheme.accentBlue,
                      highlightBlue: ColorTheme.highlightBlue,
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
                          controller: addBranchesController
                              .registrationNumberController,
                          mediumBlue: ColorTheme.mediumBlue,
                          accentBlue: ColorTheme.accentBlue,
                          highlightBlue: ColorTheme.highlightBlue,
                        ),
                        _buildFormField(
                          context,
                          label: "Branch Number",
                          hint: "Enter branch number",
                          icon: Icons.tag,
                          controller:
                              addBranchesController.branchNumberController,
                          mediumBlue: ColorTheme.mediumBlue,
                          accentBlue: ColorTheme.accentBlue,
                          highlightBlue: ColorTheme.highlightBlue,
                        ),
                      ],
                      mediumBlue: ColorTheme.mediumBlue,
                      accentBlue: ColorTheme.accentBlue,
                      highlightBlue: ColorTheme.highlightBlue,
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
                          controller:
                              addBranchesController.employeesCountController,
                          mediumBlue: ColorTheme.mediumBlue,
                          accentBlue: ColorTheme.accentBlue,
                          highlightBlue: ColorTheme.highlightBlue,
                        ),
                      ],
                      mediumBlue: ColorTheme.mediumBlue,
                      accentBlue: ColorTheme.accentBlue,
                      highlightBlue: ColorTheme.highlightBlue,
                    ),
                    SizedBox(height: 90.h), // Extra space for bottom buttons
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
                    // Check if all fields are filled
                    if (addBranchesController.areFieldsValid()) {
                      // Get the branch data
                      Map<String, dynamic> branchData =
                          addBranchesController.getBranchData();

                      // Add branch to the list
                      branchListController.addBranch(branchData);

                      // Clear all fields
                      addBranchesController.clearFields();

                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Branch added successfully!"),
                          backgroundColor: ColorTheme.accentBlue,
                        ),
                      );
                    } else {
                      // Show error message
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
                    // Check if all fields are filled
                    if (addBranchesController.areFieldsValid()) {
                      // Get the branch data
                      Map<String, dynamic> branchData =
                          addBranchesController.getBranchData();

                      // Add branch to the list
                      branchListController.addBranch(branchData);
                      // Clear all fields
                      addBranchesController.clearFields();

                      // Navigate back to the branch list screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => BranchesListScreen(),
                        ),
                      );
                    } else {
                      // Show error message
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
    required Color mediumBlue,
    required Color accentBlue,
    required Color highlightBlue,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: mediumBlue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: accentBlue.withOpacity(0.3),
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
                  color: highlightBlue,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: TextStyle(
                    color: highlightBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: accentBlue.withOpacity(0.2)),
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
    required Color mediumBlue,
    required Color accentBlue,
    required Color highlightBlue,
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
            color: mediumBlue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: accentBlue.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Icon(
                  icon,
                  color: highlightBlue.withOpacity(0.7),
                  size: 20.sp,
                ),
              ),
              Expanded(
                  child: TextFormField(
                controller: controller,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.top,
                // textCapitalization: TextCapitalization.words,

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
                    borderSide:
                        BorderSide(color: ColorTheme.white.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: ColorTheme.white, width: 2),
                  ),
                  hintStyle: GlobalTextStyles.hintStyle(context)
                      .copyWith(color: Colors.grey),
                ),
              )
                  ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

