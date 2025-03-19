import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/painters/background_painter.dart';
import '../../../../core/constants/colors.dart';
import '../../branches_list_screen/controller/branch_list_screen_controller.dart';
import '../controller/branch_details_screen_controller.dart';



class BranchDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> branchData;
  final int branchIndex;

  const BranchDetailsScreen({
    Key? key,
    required this.branchData,
    required this.branchIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = BranchDetailsController();
        controller.init(branchData);
        return controller;
      },
      child: _BranchDetailsView(branchIndex: branchIndex),
    );
  }
}

class _BranchDetailsView extends StatelessWidget {
  final int branchIndex;

  const _BranchDetailsView({
    Key? key,
    required this.branchIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the controller from provider
    final controller = Provider.of<BranchDetailsController>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;


    return Scaffold(
      backgroundColor: ColorTheme.darkBlue,
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
            color: ColorTheme.highlightBlue,
            size: isMobile ? 20.sp : (isTablet ? 16.sp : 8.sp),
          ),
        ),
        title: Text(
          "RABLOON",
          style: TextStyle(
            color: ColorTheme.highlightBlue,
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
              painter: BackgroundPainter(),
            ),
          ),

          // Content
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                controller: controller.scrollController,
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
                          color: ColorTheme.mediumBlue.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: ColorTheme.accentBlue.withOpacity(0.3),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorTheme.lightBlue.withOpacity(0.1),
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
                              color: ColorTheme.highlightBlue,
                              size: 40.sp,
                            ),
                            SizedBox(height: 16.h),
                            controller.isEditing
                                ? TextField(
                              controller: controller.branchNameController,
                              focusNode: controller.branchNameFocusNode,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Branch Name",
                                hintStyle: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              onSubmitted: (_) {
                                FocusScope.of(context).requestFocus(controller.locationFocusNode);
                              },
                            )
                                : Text(
                              controller.editedBranchData["branchName"] ?? "Branch Name",
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
                        context: context,
                        title: "Branch Details",
                        icon: Icons.store,
                        details: [
                          _buildDetailItem(
                            context: context,
                            label: "Branch Name",
                            value: controller.editedBranchData["branchName"] ?? "-",
                            icon: Icons.business_center,
                            isEditing: controller.isEditing,
                            controller: controller.branchNameController,
                            focusNode: controller.branchNameFocusNode,
                            nextFocusNode: controller.locationFocusNode,
                          ),
                          _buildDetailItem(
                            context: context,
                            label: "Branch Location",
                            value: controller.editedBranchData["location"] ?? "-",
                            icon: Icons.location_on,
                            isEditing: controller.isEditing,
                            controller: controller.locationController,
                            focusNode: controller.locationFocusNode,
                            nextFocusNode: controller.registrationNumberFocusNode,
                          ),
                        ],
                        mediumBlue: ColorTheme.mediumBlue,
                        accentBlue: ColorTheme.accentBlue,
                        highlightBlue: ColorTheme.highlightBlue,
                      ),
                      SizedBox(height: 16.h),

                      // Registration information section
                      _buildDetailSection(
                        title: "Registration Information",
                        icon: Icons.description,
                        details: [
                          _buildDetailItem(
                            label: "Company Registration Number",
                            value: controller.editedBranchData["registrationNumber"] ?? "-",
                            icon: Icons.numbers,
                            isEditing: controller.isEditing,
                            controller: controller.registrationNumberController,
                            focusNode: controller.registrationNumberFocusNode,
                            nextFocusNode: controller.branchNumberFocusNode, context: context,
                          ),
                          _buildDetailItem(

                            label: "Branch Number",
                            value: controller.editedBranchData["branchNumber"] ?? "-",
                            icon: Icons.tag,
                            isEditing: controller.isEditing,
                            controller: controller.branchNumberController,
                            focusNode: controller.branchNumberFocusNode,
                            nextFocusNode: controller.employeesCountFocusNode, context: context,
                          ),
                        ],
                        mediumBlue: ColorTheme.mediumBlue,
                        accentBlue: ColorTheme.accentBlue,
                        highlightBlue: ColorTheme.highlightBlue, context: context,
                      ),
                      SizedBox(height: 16.h),

                      // Staffing section
                      _buildDetailSection(
                        title: "Staffing",
                        icon: Icons.people,
                        details: [
                          _buildDetailItem(
                            label: "Number of Employees",
                            value: controller.editedBranchData["employeesCount"] ?? "-",
                            icon: Icons.person_add,
                            isEditing: controller.isEditing,
                            controller: controller.employeesCountController,
                            focusNode: controller.employeesCountFocusNode,
                            nextFocusNode: null, context: context, // No next field
                          ),
                        ],
                        mediumBlue: ColorTheme.mediumBlue,
                        accentBlue: ColorTheme.accentBlue,
                        highlightBlue: ColorTheme.highlightBlue, context: context,
                      ),
                      SizedBox(height: 24.h),
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
          color: ColorTheme.darkBlue,
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
            // SAVE & EDIT Button
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorTheme.accentBlue,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: TextButton.icon(
                  onPressed: controller.isEditing
                      ? () => controller.saveChanges(context, branchIndex)
                      : controller.toggleEditMode,
                  icon: Icon(
                    controller.isEditing ? Icons.save : Icons.mode_edit_outline_outlined,
                    color: ColorTheme.highlightBlue,
                    size: 20.sp,
                  ),
                  label: Text(
                    controller.isEditing ? "SAVE CHANGES" : "EDIT BRANCH",
                    style: TextStyle(
                      color: ColorTheme.highlightBlue,
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
    required BuildContext context,
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
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
    required bool isEditing,
    required TextEditingController controller,
    required FocusNode focusNode,
    FocusNode? nextFocusNode,
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
                isEditing
                    ? TextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: value,
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  textInputAction: nextFocusNode != null
                      ? TextInputAction.next
                      : TextInputAction.done,
                  onSubmitted: (_) {
                    if (nextFocusNode != null) {
                      FocusScope.of(context).requestFocus(nextFocusNode);
                    } else {
                      // Get controller and save changes if it's the last field
                      final detailsController = Provider.of<BranchDetailsController>(context, listen: false);
                      detailsController.saveChanges(context, branchIndex);
                    }
                  },
                )
                    : Text(
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