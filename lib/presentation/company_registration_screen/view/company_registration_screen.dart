import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for input formatters
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import '../../../../core/constants/colors.dart';
import '../../owner_registration_screen/view/owner_registration_screen.dart';
import '../controller/company_registration_controller.dart';

class CompanyRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    return ChangeNotifierProvider(
      create: (_) => CompanyRegistrationController(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ColorTheme.darkBlue,
        appBar: AppBar(
          backgroundColor: ColorTheme.darkBlue,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorTheme.highlightBlue,
              size: 24.sp,
            ),
            onPressed: () {
              final controller = Provider.of<CompanyRegistrationController>(context, listen: false);
              if (controller.currentPage > 0) {
                controller.previousPage();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          title: Text(
            "RABLOON",
            style: GlobalTextStyles.appBarHeading(context),
          ),
        ),
        body: Consumer<CompanyRegistrationController>(
          builder: (context, controller, child) {
            return Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: LinearProgressIndicator(
                          value: (controller.currentPage + 1) / (controller.fields.length + 1),
                          backgroundColor: Colors.white.withOpacity(0.1),
                          valueColor: AlwaysStoppedAnimation<Color>(ColorTheme.highlightBlue),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          "Share your company details to get started!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "STEP ${controller.currentPage + 1} OF ${controller.fields.length + 1}",
                        style: TextStyle(
                          color: ColorTheme.highlightBlue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          controller: controller.pageController,
                          physics: NeverScrollableScrollPhysics(),
                          onPageChanged: (index) {
                            controller.updateCurrentPage(index);
                          },
                          children: [
                            ...controller.fields.asMap().entries.map((entry) {
                              int idx = entry.key;
                              String field = entry.value;
                              TextInputType keyboardType = TextInputType.text; // Default to text input

                              // Set keyboard type to number for specific fields
                              if (field == "Registration Number" || field == "Number of Owners" || field == "Number of Branches") {
                                keyboardType = TextInputType.number;
                              }

                              return _buildInputPage(field, controller.icons[idx], controller, keyboardType: keyboardType);
                            }).toList(),
                            _buildSummaryPage(controller),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Consumer<CompanyRegistrationController>(
          builder: (context, controller, child) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  if (controller.currentPage < controller.fields.length) {
                    controller.nextPage();
                  } else {
                    controller.submit(context);
                  }
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorTheme.highlightBlue,
                        Color(0xFF1A6ED8),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorTheme.highlightBlue.withOpacity(0.4),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      controller.currentPage < controller.fields.length ? "Continue" : "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputPage(String field, IconData icon, CompanyRegistrationController controller, {TextInputType keyboardType = TextInputType.text}) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80.sp,
              color: ColorTheme.highlightBlue.withOpacity(0.7),
            ),
            SizedBox(height: 40.h),
            Text(
              "Enter $field",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  controller.updateAnswer(field, value);
                },
                onSubmitted: (value) {
                  if (controller.currentPage < controller.fields.length) {
                    controller.nextPage();
                  }
                },
                keyboardType: keyboardType, // Set the keyboard type
                inputFormatters: keyboardType == TextInputType.number
                    ? [FilteringTextInputFormatter.digitsOnly] // Restrict to digits only
                    : [], // No restriction for other fields
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorTheme.mediumBlue.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Enter $field here",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 16.sp,
                  ),
                  errorText: controller.errors[field],
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 24.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryPage(CompanyRegistrationController controller) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Text(
              "Company Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: ColorTheme.highlightBlue.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.fields.length,
                itemBuilder: (context, index) {
                  String field = controller.fields[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      children: [
                        Icon(
                          controller.icons[index],
                          color: ColorTheme.highlightBlue,
                          size: 24.sp,
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                field,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                controller.answers[field] ?? "Not provided",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Divider(color: Colors.white24),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}