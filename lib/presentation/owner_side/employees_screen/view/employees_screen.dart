import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/view/employees_adding_screen.dart';
import 'package:salonrabcode/presentation/owner_side/employees_screen/widget/employee_name_conatiner.dart';
import 'package:salonrabcode/core/common/widget/serach_bar.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0D1137),
                Color(0xFF1A2151),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: GlobalTextStyles.appBarHeadding1(context),
        ),
        // actions: [
        //   Text(
        //     "RABLOON",
        //     style: GlobalTextStyles.appBarHeadding(context),
        //   ),
        // ],
      ),
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A2151),
                  Color(0xFF0D1137),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        size: 25.sp,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Your Salon Employees",
                        style: GlobalTextStyles.subHeadding1(context),
                      ),
                    ],
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
