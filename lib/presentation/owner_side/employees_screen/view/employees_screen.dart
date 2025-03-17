import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employees_screen/widget/employee_name_conatiner.dart';
import 'package:salonrabcode/core/common/widget/serach_bar.dart';

import '../../../../core/common/painters/background_painter.dart';

class EmployeesScreen extends StatelessWidget {
  final List<String> employees = [
    'Jhon',
    'Adam',
    'Ram',
    'Rahul',
    'Arul',
    'Manu',
  ];
  EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;

    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    double aspectRatio = isMobile ? 2 : (isTablet ? 1.8 : 1.6);
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 10.w);
    return Scaffold(
      backgroundColor: ColorTheme.darkBlue,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("RABLOON", style: GlobalTextStyles.appBarHeading(context)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
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
                          Icons.person,
                          color: ColorTheme.highlightBlue,
                          size: isMobile ? 24.sp : 18.sp,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Your Salon Employees",
                          style: GlobalTextStyles.subHeading(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isMobile ? 15.h : 20.h),
                  SearchBarSalon(
                    hintText: 'Search Employees',
                  ),
                  SizedBox(height: isMobile ? 15.h : 20.h),
                  Expanded(
                    child: GridView.builder(
                      itemCount: employees.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount, // Adjust dynamically
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio:
                            aspectRatio, // Fixed for better visibility
                      ),
                      itemBuilder: (context, index) {
                        return EmpllooyeeNameContainer(
                          name: employees[index],
                          isMobile: isMobile,
                          isTablet: isTablet,
                          isLaptop: isLaptop,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => EmployeesAddingScreen()));
        },
        backgroundColor: Colors.teal, // Use your theme color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r), // Adjust radius
        ),
        label: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.w, vertical: 10.h), // Adjust padding
          child: Text(
            "Add Employees",
            style: GlobalTextStyles.floatingButtonText(context),
          ),
        ),
      ),
    );
  }
}
