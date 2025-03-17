import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/presentation/owner_side/add_branches_screen/view/add_branches_screen.dart';
import 'package:salonrabcode/presentation/owner_side/branches_list_screen/controller/branch_list_screen_controller.dart';
import '../../../../core/common/painters/background_painter.dart';
import '../../branch_details_screen/view/branch_details_screeen.dart';

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
      backgroundColor: darkBlue,
      resizeToAvoidBottomInset: false,
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
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: TextStyle(
            color: highlightBlue,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                    Consumer<BranchListScreenController>(
                      builder: (context, branchListScreenController, child) {
                        return branchListScreenController.subBranches.isEmpty
                            ? Center(
                                child: Container(
                                  height: 100.h,
                                  child: Center(
                                    child: Text(
                                      "No sub branches added yet",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: branchListScreenController
                                    .subBranches.length,
                                itemBuilder: (context, index) {
                                  final branch = branchListScreenController
                                      .subBranches[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: _buildBranchCardWithDeleteIcon(
                                      context,
                                      branch["branchName"] ?? "",
                                      branch["location"] ?? "",
                                      index,
                                      branch,
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
                    SizedBox(height: 80.h), // Add space at bottom
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddBranchesScreen(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBranchCardWithDeleteIcon(
    BuildContext context,
    String branchName,
    String location,
    int index,
    Map<String, dynamic> branchData,
    BranchListScreenController branchListScreenController,
    Color mediumBlue,
    Color accentBlue,
    Color highlightBlue,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigate to branch details screen when tapped
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BranchDetailsScreen(branchData: branchData),
          ),
        );
      },
      child: Container(
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
          trailing: SizedBox(
            // Constrain the trailing widget
            width: 40.w, // Adjust the width as needed
            child: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.white70,
              ),
              onPressed: () {
                // Show confirmation dialog before deleting
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: mediumBlue,
                      title: Text(
                        "Delete Branch",
                        style: TextStyle(color: highlightBlue),
                      ),
                      content: Text(
                        "Are you sure you want to delete this branch?",
                        style: TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white70),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accentBlue,
                          ),
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            branchListScreenController.deleteBranch(index);
                            Navigator.of(context).pop();

                            // Show snackbar confirmation
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Branch deleted successfully"),
                                backgroundColor: accentBlue,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

