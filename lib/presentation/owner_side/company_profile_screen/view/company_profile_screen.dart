import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/company_profile_screen/controller/company_profile_screen_controller.dart';

class CompanyProfileScreen extends StatelessWidget {
  final CompanyProfileScreenController controller =
      CompanyProfileScreenController();
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
            children: [
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
                      buildEditableField(
                        "Company Name",
                        controller.companyName,
                        (value) => controller.updateField(0, value),
                        isMobile,
                        isTablet,
                        0,
                        controller,
                      ),
                      SizedBox(height: 16.h),
                      buildEditableField(
                        "Company Registration Number",
                        controller.companyRegistrationNumber,
                        (value) => controller.updateField(0, value),
                        isMobile,
                        isTablet,
                        1,
                        controller,
                      ),
                      SizedBox(height: 16.h),
                      buildEditableField(
                        "Company Location",
                        controller.companyLocation,
                        (value) => controller.updateField(0, value),
                        isMobile,
                        isTablet,
                        2,
                        controller,
                      ),
                      buildEditableField(
                        "Number of Owners",
                        controller.numberOfOwners,
                        (value) => controller.updateField(0, value),
                        isMobile,
                        isTablet,
                        2,
                        controller,
                      ),
                      SizedBox(height: 16.h),
                      buildEditableField(
                        "Number of Branch",
                        controller.numberOfBranch,
                        (value) => controller.updateField(0, value),
                        isMobile,
                        isTablet,
                        2,
                        controller,
                      ),
                      SizedBox(height: 16.h),
                      buildEditableField(
                        "Main Branch",
                        controller.mainBranch,
                        (value) => controller.updateField(0, value),
                        isMobile,
                        isTablet,
                        2,
                        controller,
                      ),
                      SizedBox(height: 16.h),
                      buildEditableField(
                        "Number of Employees",
                        controller.numberOfEmployee,
                        (value) => controller.updateField(0, value),
                        isMobile,
                        isTablet,
                        2,
                        controller,
                      ),
                      SizedBox(height: 16.h),
                    ]),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 80.h,
                width: double
                    .infinity, // Makes the button fit the full screen width
                child: ElevatedButton(
                  onPressed: () {
                    print("Button Pressed!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.maincolor, // Button color
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.r), // Adjust corner radius
                    ), // Makes it stadium-shaped
                  ),
                  child: Text(
                    "ADD BRANCHES",
                    style: GlobalTextStyles.floatingButtonText(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditableField(
    String label,
    String value,
    Function(String) onSave,
    bool isMobile,
    bool isTablet,
    int index,
    CompanyProfileScreenController controller,
  ) {
    return Consumer<CompanyProfileScreenController>(
      builder: (context, controller, child) {
        bool isEditable = controller.editingFieldIndex == index;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GlobalTextStyles.textFormfieldHead(context)),
            SizedBox(height: 8.h),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: ColorTheme.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      // Add this to prevent overflow
                      child: isEditable
                          ? TextFormField(
                              initialValue: value,
                              onChanged: onSave,
                              style: GlobalTextStyles.serviceContainer(context),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )
                          : Text(
                              value,
                              style: GlobalTextStyles.serviceContainer(context),
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                    Flexible(
                      child: IconButton(
                        icon: Icon(
                          isEditable ? Icons.check : Icons.edit,
                          color: ColorTheme.maincolor,
                          size: isMobile ? 17.sp : (isTablet ? 22.sp : 26.sp),
                        ),
                        onPressed: () {
                          controller.editingFieldIndex =
                              isEditable ? null : index;
                          controller.notifyListeners();
                        },
                      ),
                    ),
                  ],
                )),
          ],
        );
      },
    );
  }
}
