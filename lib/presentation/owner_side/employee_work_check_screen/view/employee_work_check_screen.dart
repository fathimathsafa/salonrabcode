import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonrabcode/core/common/painters/background_painter.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

class EmployeeWorkCheckScreen extends StatelessWidget {
  const EmployeeWorkCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;
    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    double aspectRatio = isMobile ? 2 : (isTablet ? 1.8 : 1.6);
    return Scaffold(
      backgroundColor: ColorTheme.darkBlue,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: ColorTheme.accentBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.work_history_outlined,
                              color: ColorTheme.highlightBlue,
                              size: isMobile ? 24.sp : 18.sp,
                            ),
                            SizedBox(width: 12.w),
                            Text("Check Your Employe's Works",
                                style: GlobalTextStyles.subHeading(context)),
                          ],
                        ),
                        Text(
                          "Check employe's completed works",
                          style: GlobalTextStyles.hintAndCategoryText(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  _buildFormSection(
                    context,
                    title: "Today's Works",
                    icon: Icons.content_cut,
                    fields: _buildWorkList(context),
                    mediumBlue: ColorTheme.mediumBlue,
                    accentBlue: ColorTheme.accentBlue,
                    highlightBlue: ColorTheme.highlightBlue,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorTheme.darkBlue, // Dark background for contrast
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "Total Amount:",
                style: GlobalTextStyles.containerHeadding(context),
              ),
            ),
            Flexible(
              child: Text(
                "\$100000000000000-0",
                style: GlobalTextStyles.containerHeadding(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWorkList(BuildContext context) {
    final List<Map<String, dynamic>> customerWorks = [
      {
        "customerId": "CUST123",
        "services": ["Haircut", "Shave", "Facial"],
        "totalAmount": 50.0,
      },
      {
        "customerId": "CUST456",
        "services": ["Hair Coloring", "Beard Trim"],
        "totalAmount": 35.0,
      },
      {
        "customerId": "CUST789",
        "services": ["Massage", "Manicure", "Pedicure", "Hair Spa"],
        "totalAmount": 75.0,
      },
      {
        "customerId": "CUST101",
        "services": ["Body Scrub", "Hair Treatment"],
        "totalAmount": 55.0,
      },
      {
        "customerId": "CUST112",
        "services": ["Full Body Massage", "Facial"],
        "totalAmount": 90.0,
      },
      {
        "customerId": "CUST131",
        "services": ["Nail Art", "Hair Spa"],
        "totalAmount": 40.0,
      },
    ];

    return customerWorks.map((customer) {
      return Container(
        width: double.infinity, // Ensures uniform width
        margin: EdgeInsets.symmetric(vertical: 8.h), // Responsive margin
        padding: EdgeInsets.all(12.w), // Responsive padding
        decoration: BoxDecoration(
          color: ColorTheme.mediumBlue.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10.r), // Responsive border radius
          border: Border.all(
            color: ColorTheme.accentBlue.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customer ID: ${customer['customerId']}",
              style: GlobalTextStyles.hintAndCategoryText(
                  context), // Pass context here
            ),
            SizedBox(height: 5.h), // Responsive spacing
            Text(
              "Services: ${customer['services'].join(', ')}",
              style:
                  GlobalTextStyles.saveButton(context), // Responsive font size
            ),
            SizedBox(height: 5.h),
            Text(
              "Total Amount: \$${customer['totalAmount']}",
              style: GoogleFonts.urbanist(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: ColorTheme.highlightBlue,
              ),
            ),
          ],
        ),
      );
    }).toList();
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
                Text(title, style: GlobalTextStyles.containerHeadding(context)),
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
}
