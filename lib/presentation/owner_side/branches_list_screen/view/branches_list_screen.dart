import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/presentation/owner_side/add_branches_screen/view/add_branches_screen.dart';
import 'package:salonrabcode/presentation/owner_side/branches_list_screen/controller/branch_list_screen_controller.dart';

class BranchesListScreen extends StatelessWidget {
  const BranchesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen size variables
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;

    // Dark blue color palette from AddBranchesScreen
    final darkBlue = const Color(0xFF0A1128);
    final mediumBlue = const Color(0xFF1C2E4A);
    final lightBlue = const Color(0xFF31639C);
    final accentBlue = const Color(0xFF4D9DE0);
    final highlightBlue = const Color(0xFF7EDFFF);

    return Scaffold(
      backgroundColor: darkBlue, // Changed background color
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true, // Match AddBranchesScreen style
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, // Transparent AppBar
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white, // Changed color
            size: isMobile ? 20.sp : (isTablet ? 16.sp : 8.sp),
          ),
        ),
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: TextStyle(
            color: highlightBlue, // Changed color
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 20.sp : (isTablet ? 16.sp : 12.sp),
            letterSpacing: 1.5,
          ),
        ),
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
                            "Branches",
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
                    Text(
                      "Main Branch",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    // Main branch card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: mediumBlue.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: accentBlue.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: lightBlue.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "CABELLO",
                            style: TextStyle(
                              color: highlightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white70,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "LOCATION",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Sub Branches",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Sub branches list
                    SizedBox(
                      height: 300.h,
                      child: Consumer<BranchListScreenController>(
                        builder: (context, branchListScreenController, child) {
                          return branchListScreenController.subBranches.isEmpty
                              ? Center(
                            child: Text(
                              "No sub branches added yet",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14.sp,
                              ),
                            ),
                          )
                              : ListView.builder(
                            itemCount: branchListScreenController.subBranches.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: _buildBranchCardWithDeleteIcon(
                                  branchListScreenController.subBranches[index]["branchName"]!,
                                  branchListScreenController.subBranches[index]["location"]!,
                                  index,
                                  branchListScreenController,
                                  mediumBlue,
                                  accentBlue,
                                  highlightBlue,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: accentBlue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => AddBranchesScreen(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBranchCardWithDeleteIcon(
      String branchName,
      String location,
      int index,
      BranchListScreenController branchListScreenController,
      Color mediumBlue,
      Color accentBlue,
      Color highlightBlue,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: mediumBlue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: accentBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero, // Remove default padding
        title: Text(
          branchName,
          style: TextStyle(
            color: highlightBlue,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white70,
              size: 14.sp,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                location,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: SizedBox( // Constrain the trailing widget
          width: 40.w, // Adjust the width as needed
          child: IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Colors.white70,
            ),
            onPressed: () {
              branchListScreenController.deleteBranch(index);
            },
          ),
        ),
      ),
    );
  }
}

// Reuse the same BackgroundPainter class from the AddBranchesScreen
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