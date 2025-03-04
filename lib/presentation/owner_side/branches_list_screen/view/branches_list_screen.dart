import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/branches_list_screen/controller/branch_list_screen_controller.dart';

class BranchesListScreen extends StatelessWidget {
  const BranchesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 10.w);
    return Scaffold(
      backgroundColor: ColorTheme.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorTheme.maincolor,
            size: isMobile ? 20.sp : (isTablet ? 10.sp : 5.sp),
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
          padding: EdgeInsets.only(left: padding, right: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Main Branch",
                style: GlobalTextStyles.subHeadding(context),
              ),
              SizedBox(height: isMobile ? 10.h : 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  color: ColorTheme.maincolor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "CABELLO",
                      style: GlobalTextStyles.saveButtonText(context),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "LOCATION",
                      style: GlobalTextStyles.textFormfieldStyle(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 10.h : 20.h),
              Text(
                "Sub Branches",
                style: GlobalTextStyles.subHeadding(context),
              ),
              SizedBox(
                height: 300.h, // Adjust based on your UI needs
                child: Consumer<BranchListScreenController>(
                  builder: (context, branchLisScreenController, child) {
                    return ListView.builder(
                      itemCount: branchLisScreenController.subBranches.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: 16.h), // Responsive bottom padding
                          child: _buildBranchCardWithDeleteIcon(
                            branchLisScreenController.subBranches[index]
                                ["branchName"]!,
                            branchLisScreenController.subBranches[index]
                                ["location"]!,
                            index,
                            branchLisScreenController,
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
    );
  }

  Widget _buildBranchCardWithDeleteIcon(String branchName, String location,
      int index, BranchListScreenController branchLisScreenController) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h, // Responsive vertical padding
        horizontal: 16.w, // Responsive horizontal padding
      ),
      decoration: BoxDecoration(
        color: ColorTheme.maincolor,
        borderRadius: BorderRadius.circular(8.r), // Responsive border radius
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          branchName,
        
        ),
        subtitle: Text(
          location,
          // style: GLTextStyles.drawerbuttontext(),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: ColorTheme.white),
          onPressed: () {
            // Call the delete method from BranchProvider
            branchLisScreenController.deleteBranch(index);
          },
        ),
      ),
    );
  }
}
