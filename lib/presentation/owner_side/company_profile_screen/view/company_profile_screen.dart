  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:provider/provider.dart';
  import 'package:salonrabcode/core/constants/colors.dart';
  import 'package:salonrabcode/presentation/owner_side/add_branches_screen/view/add_branches_screen.dart';
  import 'package:salonrabcode/presentation/owner_side/company_profile_screen/controller/company_profile_screen_controller.dart';

  import '../../../../core/common/painters/background_painter.dart';
import '../../../../core/constants/text_styles.dart';


  class CompanyProfileScreen extends StatelessWidget {
    const CompanyProfileScreen({Key? key}) : super(key: key);

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
              style: GlobalTextStyles.appBarHeading(context)
          ),

        ),
        body: Stack(
          children: [
            // Background decoration
            Positioned.fill(
              child: CustomPaint(
                painter: BackgroundPainter(
                ),
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
                        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h), // Responsive padding
                        child: Consumer<CompanyProfileScreenController>(
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
                                        focusNode: controller.focusNodes[0], // Pass the focus node
                                        controller: controller.nameController,
                                        label: "Company Name",
                                        icon: Icons.store,
                                        index: 0,
                                        currentField: controller.currentField,
                                        onTap: () => controller.setCurrentField(0),
                                        context: context,
                                      ),
                                      buildInputField(
                                        focusNode: controller.focusNodes[1], // Pass the focus node
                                        controller: controller.regNumberController,
                                        label: "Company Registration Number",
                                        icon: Icons.numbers,
                                        index: 1,
                                        currentField: controller.currentField,
                                        onTap: () => controller.setCurrentField(1),
                                        context: context,
                                      ),
                                      buildInputField(
                                        focusNode: controller.focusNodes[2], // Pass the focus node

                                        controller: controller.locationController,
                                        label: "Company Location",
                                        icon: Icons.location_on,
                                        index: 2,
                                        currentField: controller.currentField,
                                        onTap: () => controller.setCurrentField(2),
                                        context: context,
                                      ),
                                      buildInputField(
                                        focusNode: controller.focusNodes[3], // Pass the focus node

                                        controller: controller.ownersController,
                                        label: "Number of Owners",
                                        icon: Icons.people,
                                        isNumeric: true,
                                        index: 3,
                                        currentField: controller.currentField,
                                        onTap: () => controller.setCurrentField(3),
                                        context: context,
                                      ),
                                      buildInputField(
                                        focusNode: controller.focusNodes[4], // Pass the focus node

                                        controller: controller.branchesController,
                                        label: "Number of Branches",
                                        icon: Icons.account_tree,
                                        isNumeric: true,
                                        index: 4,
                                        currentField: controller.currentField,
                                        onTap: () => controller.setCurrentField(4),
                                        context: context,
                                      ),
                                      buildInputField(
                                        focusNode: controller.focusNodes[5], // Pass the focus node

                                        controller: controller.mainBranchController,
                                        label: "Main Branch",
                                        icon: Icons.home_work,
                                        index: 5,
                                        currentField: controller.currentField,
                                        onTap: () => controller.setCurrentField(5),
                                        context: context,
                                      ),
                                      buildInputField(
                                        focusNode: controller.focusNodes[6], // Pass the focus node

                                        controller: controller.employeesController,
                                        label: "Number of Employees",
                                        icon: Icons.groups,
                                        isNumeric: true,
                                        index: 6,
                                        currentField: controller.currentField,
                                        onTap: () => controller.setCurrentField(6),
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

                  // Add Branch Button (outside SingleChildScrollView)
                  Container(
                    width: double.infinity,
                    height: 45 .h,
                    margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h), // Responsive margin
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AddBranchesScreen()));
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
                              "ADD BRANCH",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Icon(Icons.add, size: 20.sp),
                          ],
                        ),
                      ),
                    ),
                  )                ],
              ),
            ),
          ],
        ),
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
                // textInputAction: TextInputAction.next,
                focusNode: focusNode, // Assign the focus node
                controller: controller,
                keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
                inputFormatters: isNumeric ? [FilteringTextInputFormatter.digitsOnly] : null,
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
                      Provider.of<CompanyProfileScreenController>(context, listen: false).saveField(context, index);
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

