import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/presentation/owner_side/owner_profile_screen/controller/owner_profile_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/partners_adding_screen/view/partners_adding_screen.dart';

import '../../../../core/common/painters/background_painter.dart';
import '../../../../core/constants/text_styles.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: GlobalTextStyles.appBarHeading(context),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: ColorTheme.highlightBlue, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // Add Employee Icon in AppBar Trailing
          IconButton(
            icon: Icon(Icons.badge, color: ColorTheme.highlightBlue, size: 20.sp),
            onPressed: () {
              _showMakeMeEmployeeBottomSheet(context); // Show bottom sheet
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
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                      child: Consumer<OwnerProfileScreenController>(
                        builder: (context, controller, child) {
                          return Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header
                                buildHeaderSection(),
                                SizedBox(height: 30.h),

                                // Form Fields
                                Column(
                                  children: [
                                    buildInputField(
                                      controller: controller.nameController,
                                      focusNode: controller.focusNodes[0], // Pass the focus node
                                      label: "Owner Name",
                                      icon: Icons.person,
                                      index: 0,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(0),
                                      context: context,
                                    ),
                                    buildInputField(
                                      focusNode: controller.focusNodes[1], // Pass the focus node
                                      controller: controller.phoneController,
                                      label: "Phone Number",
                                      icon: Icons.phone,
                                      index: 1,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(1),
                                      context: context,
                                    ),
                                    buildInputField(
                                      focusNode: controller.focusNodes[2], // Pass the focus node
                                      controller: controller.emailController,
                                      label: "Email",
                                      icon: Icons.email,
                                      index: 2,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(2),
                                      context: context,
                                    ),
                                    buildInputField(
                                      focusNode: controller.focusNodes[3], // Pass the focus node
                                      controller: controller.aadharController,
                                      label: "Aadhar Number",
                                      icon: Icons.badge,
                                      index: 3,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(3),
                                      context: context,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Button Section (Only Add Salon Partners Button Remains)
                Column(
                  children: [
                    // First Button - Add Salon Partners
                    Container(
                      width: double.infinity,
                      height: 45.h,
                      margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4D9DE0),
                            Color(0xFF7EDFFF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4D9DE0).withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PartnersAddingScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ADD SALON PARTNERS",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(Icons.group_add, size: 20.sp),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to show the bottom sheet
  void _showMakeMeEmployeeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color:ColorTheme.mediumBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Make Me As An Employee",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10.h),
IconButton(   onPressed: () {
  Navigator.pop(context); // Close the bottom sheet
  // Navigate to the desired screen
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EmployeeScreen(), // Replace with your screen
    ),
  );
}, icon: Icon(Icons.arrow_circle_right,color: ColorTheme.highlightBlue,))            ],
          ),
        );
      },
    );
  }

  Widget buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFF4D9DE0).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                Icons.person,
                color: const Color(0xFF7EDFFF),
                size: 30.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FATHIMA",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: const Color(0xFF7EDFFF),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Nasrin",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.95),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumeric = false,
    required int index,
    required int currentField,
    required VoidCallback onTap,
    required BuildContext context,
    required FocusNode focusNode, // Add this parameter
  }) {
    bool isActive = currentField == index;

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16.sp,
                  color: isActive ? const Color(0xFF7EDFFF) : Colors.white70,
                ),
                SizedBox(width: 8.w),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isActive ? const Color(0xFF7EDFFF) : Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF1C2E4A).withOpacity(0.8) : const Color(0xFF1C2E4A).withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isActive ? const Color(0xFF7EDFFF) : const Color(0xFF4D9DE0).withOpacity(0.3),
                width: isActive ? 2 : 1,
              ),
              boxShadow: isActive ? [
                BoxShadow(
                  color: const Color(0xFF7EDFFF).withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                )
              ] : null,
            ),
            child: TextFormField(
              controller: controller,
              focusNode: focusNode, // Assign the focus node
              keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
              onTap: onTap,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                suffixIcon: isActive ? IconButton(
                  icon: Icon(Icons.save, size: 18.sp),
                  color: const Color(0xFF7EDFFF),
                  onPressed: () {
                    // Save the field
                    Provider.of<OwnerProfileScreenController>(context, listen: false).saveField(context, index);
                  },
                ) : null,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Employee Screen (Replace with your actual screen)
class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Screen"),
      ),
      body: Center(
        child: Text("Welcome to the Employee Screen!"),
      ),
    );
  }
}