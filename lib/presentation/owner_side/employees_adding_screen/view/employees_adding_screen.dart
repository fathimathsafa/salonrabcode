import 'package:flutter/material.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_textformfield.dart';

class EmployeesAddingScreen extends StatelessWidget {
  const EmployeesAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorTheme.maincolor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: GlobalTextStyles.appBarHeadding(context),
        ),
        backgroundColor: ColorTheme.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Your Employees",
                style: GlobalTextStyles.subHeadding(context),
              ),
              SizedBox(height: isMobile ? 10.h : 20.h),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: ColorTheme.maincolor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorTheme.maincolor, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Employee Name",
                      style: GlobalTextStyles.textFormfieldHead(context),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    CommonTextFormField(
                      hintText: 'Enter employee name ',
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    Text(
                      "User Name",
                      style: GlobalTextStyles.textFormfieldHead(context),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    CommonTextFormField(
                      hintText: 'Enter user name ',
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    Text(
                      "Password",
                      style: GlobalTextStyles.textFormfieldHead(context),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    CommonTextFormField(
                      hintText: 'Enter password ',
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 10.h : 20.h),
              Text(
                "Service List",
                style: GlobalTextStyles.subHeadding(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
