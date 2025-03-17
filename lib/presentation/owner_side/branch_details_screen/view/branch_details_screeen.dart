import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/painters/background_painter.dart';

class BranchDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> branchData;

  const BranchDetailsScreen({Key? key, required this.branchData})
      : super(key: key);

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
            child: Container(
              height: MediaQuery.of(context).size.height, // Fill the screen height
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      // Branch name header
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 24.h),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.business,
                              color: highlightBlue,
                              size: 40.sp,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              branchData["branchName"] ?? "Branch Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Branch details section
                      _buildDetailSection(
                        title: "Branch Details",
                        icon: Icons.store,
                        details: [
                          _buildDetailItem(
                            label: "Branch Name",
                            value: branchData["branchName"] ?? "-",
                            icon: Icons.business_center,
                          ),
                          _buildDetailItem(
                            label: "Branch Location",
                            value: branchData["location"] ?? "-",
                            icon: Icons.location_on,
                          ),
                        ],
                        mediumBlue: mediumBlue,
                        accentBlue: accentBlue,
                        highlightBlue: highlightBlue,
                      ),
                      SizedBox(height: 16.h),

                      // Registration information section
                      _buildDetailSection(
                        title: "Registration Information",
                        icon: Icons.description,
                        details: [
                          _buildDetailItem(
                            label: "Company Registration Number",
                            value: branchData["registrationNumber"] ?? "-",
                            icon: Icons.numbers,
                          ),
                          _buildDetailItem(
                            label: "Branch Number",
                            value: branchData["branchNumber"] ?? "-",
                            icon: Icons.tag,
                          ),
                        ],
                        mediumBlue: mediumBlue,
                        accentBlue: accentBlue,
                        highlightBlue: highlightBlue,
                      ),
                      SizedBox(height: 16.h),

                      // Staffing section
                      _buildDetailSection(
                        title: "Staffing",
                        icon: Icons.people,
                        details: [
                          _buildDetailItem(
                            label: "Number of Employees",
                            value: branchData["employeesCount"] ?? "-",
                            icon: Icons.person_add,
                          ),
                        ],
                        mediumBlue: mediumBlue,
                        accentBlue: accentBlue,
                        highlightBlue: highlightBlue,
                      ),
                      SizedBox(height: 24.h),

                      // // Edit button
                      // Container(
                      //   width: double.infinity,
                      //   height: 50.h,
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       colors: [
                      //         accentBlue,
                      //         highlightBlue,
                      //       ],
                      //       begin: Alignment.centerLeft,
                      //       end: Alignment.centerRight,
                      //     ),
                      //     borderRadius: BorderRadius.circular(16.r),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: accentBlue.withOpacity(0.4),
                      //         blurRadius: 15,
                      //         offset: const Offset(0, 8),
                      //       ),
                      //     ],
                      //   ),
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       // Navigate to edit screen (you can create this as a future enhancement)
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           content: Text("Edit functionality coming soon!"),
                      //           backgroundColor: accentBlue,
                      //         ),
                      //       );
                      //     },
                      //     // icon: Icon(
                      //     //   Icons.edit,
                      //     //   color: Colors.white,
                      //     //   size: 20.sp,
                      //     // ),
                      //     child:  Text(
                      //       "EDIT BRANCH",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         letterSpacing: 1,
                      //         fontSize: 14.sp,
                      //       ),
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.transparent,
                      //       foregroundColor: Colors.white,
                      //       shadowColor: Colors.transparent,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(16.r),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 32.h),
                    ],
                  ),
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
            // SAVE & NEW Button
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
                  onPressed: () {
                  //  Navigate to edit screen (you can create this as a future enhancement)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Edit functionality coming soon!"),
                        backgroundColor: accentBlue,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.mode_edit_outline_outlined,
                    color: highlightBlue,
                    size: 20.sp,
                  ),
                  label: Text(
                    "EDIT BRANCH",
                    style: TextStyle(
                      color: highlightBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12.sp,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection({
    required String title,
    required IconData icon,
    required List<Widget> details,
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
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: accentBlue.withOpacity(0.2), height: 1),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: details,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white70,
            size: 16.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

