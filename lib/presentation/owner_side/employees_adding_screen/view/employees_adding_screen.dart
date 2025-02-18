import 'package:flutter/material.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/widget/service_container.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_textformfield.dart';
import 'package:salonrabcode/core/common/widget/serach_bar.dart';

class EmployeesAddingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> serviceCategories = [
    {
      "category": "Haircut",
      "services": [
        {"name": "Men's Haircut", "gender": "Male", "price": "20"},
        {"name": "Women's Haircut", "gender": "Female", "price": "30"},
        {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
      ]
    },
    {
      "category": "Shaving",
      "services": [
        {"name": "Beard Trim", "gender": "Male", "price": "10"},
        {"name": "Clean Shave", "gender": "Male", "price": "15"},
      ]
    },
    {
      "category": "Shaving",
      "services": [
        {"name": "Beard Trim", "gender": "Male", "price": "10"},
        {"name": "Clean Shave", "gender": "Male", "price": "15"},
      ]
    },
    {
      "category": "Shaving",
      "services": [
        {"name": "Beard Trim", "gender": "Male", "price": "10"},
        {"name": "Clean Shave", "gender": "Male", "price": "15"},
      ]
    },
    {
      "category": "Shaving",
      "services": [
        {"name": "Beard Trim", "gender": "Male", "price": "10"},
        {"name": "Clean Shave", "gender": "Male", "price": "15"},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;

    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    double aspectRatio = isMobile ? 2 : (isTablet ? 1.8 : 1.6);
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
        ),
        centerTitle: true,
        title: Text("RABLOON", style: GlobalTextStyles.appBarHeadding(context)),
        backgroundColor: ColorTheme.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Your Employees",
                  style: GlobalTextStyles.subHeadding(context)),
              SizedBox(height: isMobile ? 10.h : 20.h),

              // Employee Form
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: ColorTheme.maincolor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: ColorTheme.maincolor, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextFieldLabel("Employee Name", context),
                    CommonTextFormField(hintText: 'Enter employee name'),
                    buildTextFieldLabel("User Name", context),
                    CommonTextFormField(hintText: 'Enter user name'),
                    buildTextFieldLabel("Password", context),
                    CommonTextFormField(hintText: 'Enter password'),
                  ],
                ),
              ),

              SizedBox(height: isMobile ? 10.h : 20.h),
              Text("Service List",
                  style: GlobalTextStyles.subHeadding(context)),
              SizedBox(height: isMobile ? 10.h : 20.h),
              SearchBarSalon(hintText: 'Search Service'),
              SizedBox(height: isMobile ? 10.h : 20.h),

              // Service Grid
              SizedBox(
                height: 300.h, // Set a height for GridView
                child: GridView.builder(
                  itemCount: serviceCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: aspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return ServiceContainer(
                      name: serviceCategories[index]['category'],
                      isMobile: isMobile,
                      isTablet: isTablet,
                      isLaptop: isLaptop,
                      services: List<Map<String, String>>.from(
                          serviceCategories[index]['services']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldLabel(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
      child: Text(text, style: GlobalTextStyles.textFormfieldHead(context)),
    );
  }
}
