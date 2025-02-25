import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employee_profile_owner_screen/controller/employee_profile_owner_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/service_details_screen/controller/service_details_controller.dart';

class EmployeeProfileOwnerScreen extends StatelessWidget {
  final EmployeeProfileScreenController controller =
      EmployeeProfileScreenController();

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = ScreenUtil().screenWidth;

    bool isMobile = screenWidth <= 600.w;
    bool isTablet = screenWidth > 600.w && screenWidth <= 1024.w;
    bool isLaptop = screenWidth > 1024.w;
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);
    return Scaffold(
      backgroundColor: ColorTheme.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
                      "Employee Name",
                      controller.employeeName,
                      (value) => controller.updateField(0, value),
                      isMobile,
                      isTablet,
                      0,
                      controller,
                    ),
                    SizedBox(height: 16.h),
                    buildEditableField(
                      "Username",
                      controller.username,
                      (value) => controller.updateField(0, value),
                      isMobile,
                      isTablet,
                      1,
                      controller,
                    ),
                    SizedBox(height: 16.h),
                    buildEditableField(
                      "Password",
                      controller.password,
                      (value) => controller.updateField(0, value),
                      isMobile,
                      isTablet,
                      2,
                      controller,
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text("Today's Work",
                  style: GlobalTextStyles.subHeadding(context)),
              // Inside EmployeeProfileOwnerScreen
     Consumer<EmployeeProfileScreenController>(
  builder: (context, controller, child) {
    return controller.todaysWork.isEmpty
        ? Text(
            "No work assigned",
            style: GlobalTextStyles.textFormfieldHead(context),
          ) 
        : GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 2,
            ),
            itemCount: controller.todaysWork.length,
            itemBuilder: (context, index) {
              final work = controller.todaysWork[index];

              return Card(
                color: ColorTheme.maincolor,
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 5.h),
                child: ListTile(
  title: Text(
    work['customerName'] ?? "Unknown Customer",
    style: GlobalTextStyles.floatingButtonText(context),
  ),
  subtitle: Text(
    " ${work['customerID'] is List ? work['customerID'] : work['customerID'] ?? "N/A"}",
    style: GlobalTextStyles.floatingButtonText(context),
  ),
  trailing: SizedBox(
    width: 40.w,  // ✅ Set a fixed width to prevent overflow
    child: IconButton(
      icon: Icon(Icons.arrow_downward, color: ColorTheme.white),
      onPressed: () {
        _showBottomSheet(context, work);
      },
    ),
  ),
),

              );
            },
          );
  },
),


            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h, // Responsive height
        color: ColorTheme.maincolor,
        padding: EdgeInsets.symmetric(
            horizontal: 16.w), // Use `.w` for width-based values
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Wrap Text in Flexible to prevent overflow
            Flexible(
              child: Text(
                'Total Amount',
                style: GlobalTextStyles.hintStyle(context),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Wrap the second Text in Flexible as well
            Flexible(
              child: Text(
                '₹ 00000000000',
                style: GlobalTextStyles.hintStyle(context),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ],
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
    EmployeeProfileScreenController controller,
  ) {
    return Consumer<EmployeeProfileScreenController>(
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
                children: [
                  Expanded(
                    child: isEditable
                        ? TextFormField(
                            initialValue: value,
                            onChanged: onSave,
                            style: GlobalTextStyles.serviceContainer(context),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )
                        : Text(
                            value,
                            style: GlobalTextStyles.serviceContainer(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      isEditable ? Icons.check : Icons.edit,
                      color: ColorTheme.maincolor,
                      size: isMobile ? 17.sp : (isTablet ? 22.sp : 26.sp),
                    ),
                    onPressed: () {
                      controller.editingFieldIndex = isEditable ? null : index;
                      controller.notifyListeners();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  void _showBottomSheet(BuildContext context, Map<String, dynamic> work) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services for ${work['customerName']}",
              style: GlobalTextStyles.subHeadding(context),
            ),
            SizedBox(height: 10.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: work['services']?.length ?? 0,
              itemBuilder: (context, index) {
                final service = work['services'][index];
                return Container(
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: ColorTheme.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: ColorTheme.maincolor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Service: ${service['name']}", 
                          style: GlobalTextStyles.textFormfieldHead(context)),
                      Text("Price: ₹${service['price']}", 
                          style: GlobalTextStyles.subHeadding(context)),
                      Text("Discount: ${service['discount']}%", 
                          style: GlobalTextStyles.subHeadding(context)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

}
