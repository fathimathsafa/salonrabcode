import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employees_screen/widget/employee_name_conatiner.dart';
import 'package:salonrabcode/presentation/owner_side/service_screen/widgets/serach_bar.dart';

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
    double padding = isMobile ? 10.w : (isTablet ? 10.w : 10.w);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: GlobalTextStyles.appBarHeadding(context),
        ),
        backgroundColor: ColorTheme.white,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Your Salon Employees",
              style: GlobalTextStyles.subHeadding(context),
            ),
            SizedBox(height: isMobile ? 10.h : 20.h),
            SearchBarSalon(
              hintText: 'Search Employees',
            ),
            SizedBox(height: isMobile ? 10.h : 20.h),
            Expanded(
              child: GridView.builder(
                itemCount: employees.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Adjust dynamically
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: aspectRatio, // Fixed for better visibility
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
      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("FAB Pressed");
        },
        backgroundColor: ColorTheme.maincolor, // Use your theme color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r), // Adjust radius
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
