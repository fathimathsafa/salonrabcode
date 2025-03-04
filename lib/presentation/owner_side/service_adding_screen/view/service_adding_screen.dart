import 'package:flutter/material.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_gender_dropdown.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_textformfield.dart';

class ServiceAddingScreen extends StatelessWidget {
  const ServiceAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController genderController = TextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);

    return Scaffold(
      backgroundColor: ColorTheme.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
                "Add Your Services",
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
                      "Service Name",
                      style: GlobalTextStyles.textFormfieldHead(context),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    CommonTextFormField(
                      hintText: 'Enter your service name ',
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    Text(
                      "Category Name",
                      style: GlobalTextStyles.textFormfieldHead(context),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    CommonTextFormField(
                      hintText: 'Enter service category',
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    Text(
                      "Price",
                      style: GlobalTextStyles.textFormfieldHead(context),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    CommonTextFormField(
                      hintText: 'Enter price',
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    Text(
                      "Gender",
                      style: GlobalTextStyles.textFormfieldHead(context),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    GenderDropdown(controller: genderController),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorTheme.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w, // Responsive horizontal padding
          vertical: 15.h, // Responsive vertical padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorTheme.maincolor,
                      width: 1.w, // Responsive border width
                    ),
                    color: ColorTheme.white,
                    borderRadius:
                        BorderRadius.circular(10.r), // Responsive radius
                  ),
                  height: 50.h, // Responsive height
                  child: Center(
                    child: Text(
                      'SAVE AND NEW',
                      style: GlobalTextStyles.saveAndNewButtonText(context),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15.w), // Responsive spacing between buttons
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.maincolor,
                    borderRadius:
                        BorderRadius.circular(10.r), // Responsive radius
                  ),
                  height: 50.h, // Responsive height
                  child: Center(
                    child: Text(
                      'SAVE SERVICE',
                      style: GlobalTextStyles.saveButtonText(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
