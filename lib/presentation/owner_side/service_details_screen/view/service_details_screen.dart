import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_gender_dropdown.dart';
import 'package:salonrabcode/presentation/owner_side/service_details_screen/controller/service_details_controller.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceDetailsScreenController controller =
      ServiceDetailsScreenController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    final TextEditingController genderController = TextEditingController();

    bool isMobile = screenWidth <= 600.w;
    bool isTablet = screenWidth > 600.w && screenWidth <= 1024.w;
    bool isLaptop = screenWidth > 1024.w;
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);

    String? selectedGender; // Variable to store selected gender

    return Scaffold(
      backgroundColor: ColorTheme.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorTheme.maincolor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: GlobalTextStyles.appBarHeadding1(context),
        ),
        backgroundColor: ColorTheme.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
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
                SizedBox(height: 20.h),
                buildEditableField(
                  "Service Name",
                  controller.serviceName,
                  (value) => controller.updateField(0, value),
                  isMobile,
                  isTablet,
                  0,
                  controller,
                ),
                SizedBox(height: 16.h),
                buildEditableField(
                  "Category Name",
                  controller.category,
                  (value) => controller.updateField(0, value),
                  isMobile,
                  isTablet,
                  1,
                  controller,
                ),
                SizedBox(height: 16.h),
                buildEditableField(
                  "Price",
                  controller.price,
                  (value) => controller.updateField(0, value),
                  isMobile,
                  isTablet,
                  2,
                  controller,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Gender',
                  style: GlobalTextStyles.textFormfieldHead(context),
                ),
                SizedBox(height: 8.h),
                GenderDropdown(
                  controller: genderController,
                ),
                SizedBox(height: 20.h),
              ],
            ),
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
    ServiceDetailsScreenController controller,
  ) {
    return Consumer<ServiceDetailsScreenController>(
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
}
