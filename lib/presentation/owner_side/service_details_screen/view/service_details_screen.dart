import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/common/painters/background_painter.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_gender_dropdown.dart';
import 'package:salonrabcode/presentation/owner_side/service_details_screen/controller/service_details_controller.dart';
import 'package:provider/provider.dart';

class ServiceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    FocusNode categoryFocusNode = FocusNode();

    final provider = Provider.of<ServiceDetailsController>(context);
    bool isMobile = screenWidth <= 600.w;
    bool isTablet = screenWidth > 600.w && screenWidth <= 1024.w;
    bool isLaptop = screenWidth > 1024.w;
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);

    return Scaffold(
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
          // Background decoration
          Container(
            height: MediaQuery.of(context).size.height, // Full screen height
            width: MediaQuery.of(context).size.width, // Full screen width
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
                  child: Consumer<ServiceDetailsController>(
                    builder: (context, controller, child) {
                      return Form(
                        key: controller.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: ColorTheme.accentBlue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.details,
                                        color: ColorTheme.highlightBlue,
                                        size: isMobile ? 24.sp : 18.sp,
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(" Service Details",
                                          style: GlobalTextStyles.subHeading(
                                              context)),
                                    ],
                                  ),
                                  Text(
                                    "You can modify the details if required. ",
                                    style: GlobalTextStyles.hintAndCategoryText(
                                        context),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            _buildFormSection(
                              context,
                              title: "Service Details",
                              icon: Icons.spa,
                              fields: [
                                buildInputField(
                                  focusNode: controller
                                      .focusNodes[0], // Pass the focus node
                                  controller: controller.serviceNameController,
                                  label: "Service",
                                  icon: Icons.home_repair_service_outlined,
                                  index: 0,
                                  currentField: controller.currentField,
                                  onTap: () => controller.setCurrentField(0),
                                  context: context,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.w, bottom: 8.h),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.category_outlined,
                                        size: 16.sp,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text("Category",
                                          style: GlobalTextStyles
                                              .hintAndCategoryText(context)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    color:
                                        ColorTheme.mediumBlue.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: ColorTheme.accentBlue
                                          .withOpacity(0.3),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      )
                                    ],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      focusNode: categoryFocusNode,
                                      isExpanded: true,
                                      value: provider.selectedCategory,
                                      icon: Icon(Icons.keyboard_arrow_down,
                                          color: ColorTheme.highlightBlue
                                              .withOpacity(0.7)),
                                      iconSize: 24.h,
                                      elevation: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      dropdownColor: ColorTheme.mediumBlue,
                                      onChanged: (String? newValue) {
                                        provider.setSelectedCategory(newValue!);
                                        FocusScope.of(context)
                                            .requestFocus(categoryFocusNode);
                                      },
                                      items: provider.categories
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: GlobalTextStyles
                                                .hintAndCategoryText(context),
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                buildInputField(
                                  focusNode: controller
                                      .focusNodes[0], // Pass the focus node
                                  controller: controller.priceController,
                                  label: "Price",
                                  icon: Icons.currency_rupee,
                                  index: 0,
                                  currentField: controller.currentField,
                                  onTap: () => controller.setCurrentField(0),
                                  context: context,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.w, bottom: 8.h),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.woman_sharp,
                                        size: 16.sp,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text("Gender",
                                          style: GlobalTextStyles
                                              .hintAndCategoryText(context)),
                                    ],
                                  ),
                                ),
                                Wrap(
                                  spacing: 12.0,
                                  children: provider.genders.map((gender) {
                                    return ChoiceChip(
                                      label: Text(gender),
                                      selected:
                                          provider.selectedGender == gender,
                                      selectedColor: ColorTheme.accentBlue,
                                      backgroundColor: ColorTheme.mediumBlue
                                          .withOpacity(0.8),
                                      onSelected: (selected) {
                                        provider.setSelectedGender(gender);
                                      },
                                      labelStyle: TextStyle(
                                        color: provider.selectedGender == gender
                                            ? Colors.white
                                            : ColorTheme.highlightBlue,
                                        fontWeight:
                                            provider.selectedGender == gender
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                              mediumBlue: ColorTheme.mediumBlue,
                              accentBlue: ColorTheme.accentBlue,
                              highlightBlue: ColorTheme.highlightBlue,
                            ),
                          ],
                        ),
                      );
                    },
                  )),
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
            // SAVE & NEW Button
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
                  onPressed: () {
                    () {
                      _showDeleteConfirmationDialog(context);
                    };
                  },
                  icon: Icon(
                    Icons.delete,
                    color: ColorTheme.highlightBlue,
                    size: 20.sp,
                  ),
                  label: Text(
                    "Delete Service",
                    style: GlobalTextStyles.saveAndNewButton(context),
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
            SizedBox(width: 16.w),
            // SAVE Button
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorTheme.accentBlue,
                      ColorTheme.highlightBlue,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme.accentBlue.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Check if all fields are filled
                    // if (addBranchesController.areFieldsValid()) {
                    //   // Get the branch data
                    //   Map<String, dynamic> branchData =
                    //       addBranchesController.getBranchData();

                    //   // Add branch to the list
                    //   branchListController.addBranch(branchData);
                    //   // Clear all fields
                    //   addBranchesController.clearFields();

                    //   // Navigate back to the branch list screen
                    //   Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //       builder: (context) => BranchesListScreen(),
                    //     ),
                    //   );
                    // } else {
                    //   // Show error message
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text("Please fill all fields!"),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //   );
                    // }
                  },
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  label:
                      Text("SAVE", style: GlobalTextStyles.saveButton(context)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
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

  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumeric = false,
    required int index,
    required int currentField,
    required VoidCallback onTap,
    required BuildContext context,
    required FocusNode focusNode, // Add this parameter
  }) {
    bool isActive = currentField == index;

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16.sp,
                  color: isActive ? const Color(0xFF7EDFFF) : Colors.white70,
                ),
                SizedBox(width: 8.w),
                Text(label,
                    style: GlobalTextStyles.hintAndCategoryText(context)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF1C2E4A).withOpacity(0.8)
                  : const Color(0xFF1C2E4A).withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isActive
                    ? const Color(0xFF7EDFFF)
                    : const Color(0xFF4D9DE0).withOpacity(0.3),
                width: isActive ? 2 : 1,
              ),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: const Color(0xFF7EDFFF).withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      )
                    ]
                  : null,
            ),
            child: TextFormField(
              // textInputAction: TextInputAction.next,
              focusNode: focusNode, // Assign the focus node
              controller: controller,
              keyboardType:
                  isNumeric ? TextInputType.number : TextInputType.text,
              inputFormatters:
                  isNumeric ? [FilteringTextInputFormatter.digitsOnly] : null,
              onTap: onTap,
              style: GlobalTextStyles.hintAndCategoryText(context),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                suffixIcon: isActive
                    ? IconButton(
                        icon: Icon(Icons.save, size: 18.sp),
                        color: const Color(0xFF7EDFFF),
                        onPressed: () {
                          Provider.of<ServiceDetailsController>(context,
                                  listen: false)
                              .saveField(context, index);
                        },
                      )
                    : null,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
            ),
          ),
        ],
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
                Text(title, style: GlobalTextStyles.subHeading(context)),
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

void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r), // Responsive border radius
        ),
        backgroundColor: Color(0xFF1C2E4A), // Custom background color
        child: Padding(
          padding: EdgeInsets.all(20.w), // Responsive padding
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevent unnecessary space
            children: [
              Text("Delete Category",
                  style: GlobalTextStyles.alertBoxText(context)),
              SizedBox(height: 10.h), // Responsive spacing
              Text(
                "Are you sure you want to delete this category?",
                style: GlobalTextStyles.alertBoxSUBText(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h), // Responsive spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // No button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.r), // Responsive border radius
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w), // Responsive padding
                      ),
                      child: Text(
                        "No",
                        style: GlobalTextStyles.hintAndCategoryText(
                            context), // Responsive font size
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        print(
                            "Category deleted"); // Replace with actual delete logic
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Yes button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.r), // Responsive border radius
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w), // Responsive padding
                      ),
                      child: Text("Yes",
                          style: GlobalTextStyles.hintAndCategoryText(
                              context) // Responsive font size
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
