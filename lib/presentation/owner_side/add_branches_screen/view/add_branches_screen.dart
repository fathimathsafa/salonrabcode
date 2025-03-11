import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_textformfield.dart';

class AddBranchesScreen extends StatelessWidget {
  const AddBranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;

    // Dark blue color palette from Company Profile Screen
    final darkBlue = const Color(0xFF0A1128);
    final mediumBlue = const Color(0xFF1C2E4A);
    final lightBlue = const Color(0xFF31639C);
    final accentBlue = const Color(0xFF4D9DE0);
    final highlightBlue = const Color(0xFF7EDFFF);

    return Scaffold(
      backgroundColor: darkBlue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: isMobile ? 20.sp : (isTablet ? 16.sp : 8.sp),
          ),
        ),
        title: Text(
          "RABLOON",
          style: TextStyle(
            color: highlightBlue,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 20.sp : (isTablet ? 16.sp : 12.sp),
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Tooltip(
              message: "You need to fill all the fields to add your branch.",
              child: Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              // Optional
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background decoration
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(
                darkBlue: darkBlue,
                mediumBlue: mediumBlue,
                lightBlue: lightBlue,
                accentBlue: accentBlue,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: accentBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.business,
                            color: highlightBlue,
                            size: isMobile ? 24.sp : 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "Branch Information",
                            style: TextStyle(
                              color: highlightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 18.sp : 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    _buildFormSection(
                      context,
                      title: "Branch Details",
                      icon: Icons.store,
                      fields: [
                        _buildFormField(
                          context,
                          label: "Branch Name",
                          hint: "Enter your branch name",
                          icon: Icons.business_center,
                          mediumBlue: mediumBlue,
                          accentBlue: accentBlue,
                          highlightBlue: highlightBlue,
                        ),
                        _buildFormField(
                          context,
                          label: "Branch Location",
                          hint: "Enter your branch location",
                          icon: Icons.location_on,
                          mediumBlue: mediumBlue,
                          accentBlue: accentBlue,
                          highlightBlue: highlightBlue,
                        ),
                      ],
                      mediumBlue: mediumBlue,
                      accentBlue: accentBlue,
                      highlightBlue: highlightBlue,
                    ),
                    SizedBox(height: 16.h),
                    _buildFormSection(
                      context,
                      title: "Registration Information",
                      icon: Icons.description,
                      fields: [
                        _buildFormField(
                          context,
                          label: "Company Registration Number",
                          hint: "Enter company registration number",
                          icon: Icons.numbers,
                          mediumBlue: mediumBlue,
                          accentBlue: accentBlue,
                          highlightBlue: highlightBlue,
                        ),
                        _buildFormField(
                          context,
                          label: "Branch Number",
                          hint: "Enter branch number",
                          icon: Icons.tag,
                          mediumBlue: mediumBlue,
                          accentBlue: accentBlue,
                          highlightBlue: highlightBlue,
                        ),
                      ],
                      mediumBlue: mediumBlue,
                      accentBlue: accentBlue,
                      highlightBlue: highlightBlue,
                    ),
                    SizedBox(height: 16.h),
                    _buildFormSection(
                      context,
                      title: "Staffing",
                      icon: Icons.people,
                      fields: [
                        _buildFormField(
                          context,
                          label: "Number of Employees",
                          hint: "Enter number of employees",
                          icon: Icons.person_add,
                          mediumBlue: mediumBlue,
                          accentBlue: accentBlue,
                          highlightBlue: highlightBlue,
                        ),
                      ],
                      mediumBlue: mediumBlue,
                      accentBlue: accentBlue,
                      highlightBlue: highlightBlue,
                    ),
                    SizedBox(height: 90.h), // Extra space for bottom buttons
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: darkBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: accentBlue,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: highlightBlue,
                  ),
                  label: Text(
                    "SAVE & NEW",
                    style: TextStyle(
                      color: highlightBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 14.sp,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentBlue,
                      highlightBlue,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: accentBlue.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 14.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
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
                Text(
                  title,
                  style: TextStyle(
                    color: highlightBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
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

  Widget _buildFormField(
      BuildContext context, {
        required String label,
        required String hint,
        required IconData icon,
        required Color mediumBlue,
        required Color accentBlue,
        required Color highlightBlue,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16.sp,
                color: Colors.white70,
              ),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: mediumBlue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: accentBlue.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Icon(
                  icon,
                  color: highlightBlue.withOpacity(0.7),
                  size: 20.sp,
                ),
              ),
              Expanded(
                child: CommonTextFormField(
                  hintText: hint,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final Color darkBlue;
  final Color mediumBlue;
  final Color lightBlue;
  final Color accentBlue;

  BackgroundPainter({
    required this.darkBlue,
    required this.mediumBlue,
    required this.lightBlue,
    required this.accentBlue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the background
    Paint backgroundPaint = Paint()..color = darkBlue;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the top right decoration
    Paint gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          accentBlue.withOpacity(0.3),
          accentBlue.withOpacity(0.1),
          darkBlue.withOpacity(0),
        ],
        stops: const [0.2, 0.6, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.9, size.height * 0.1),
        radius: size.width * 0.6,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.1),
      size.width * 0.6,
      gradientPaint,
    );

    // Draw the bottom left decoration
    Paint bottomGradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          lightBlue.withOpacity(0.15),
          mediumBlue.withOpacity(0.05),
          darkBlue.withOpacity(0),
        ],
        stops: const [0.2, 0.6, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.1, size.height * 0.85),
        radius: size.width * 0.5,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.85),
      size.width * 0.5,
      bottomGradientPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}