import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/common/painters/background_painter.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employee_details_screen/controller/employee_details_controller.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/controller/employees_adding_controller.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  const EmployeeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EmployeeDetailsController>(context);

    double screenWidth = ScreenUtil().screenWidth;
    bool isMobile = screenWidth <= 600.w;
    bool isTablet = screenWidth > 600.w && screenWidth <= 1024.w;
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Background Painter
          Container(
            height: MediaQuery.of(context).size.height, // Full screen height
            width: MediaQuery.of(context).size.width, // Full screen width
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),

          // Main Content
          SafeArea(
              child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title Section
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.details,
                                      color: ColorTheme.highlightBlue,
                                      size: isMobile ? 24.sp : 18.sp,
                                    ),
                                    SizedBox(width: 12.w),
                                    Text(" Employees Details",
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
                            title: "Employee Details",
                            icon: Icons.person_2_outlined,
                            fields: [
                              buildInputField(
                                focusNode: controller
                                    .focusNodes[0], // Pass the focus node
                                controller: controller.employeeNameController,
                                label: "Employee Name",
                                icon: Icons.badge,
                                index: 0,
                                currentField: controller.currentField,
                                onTap: () => controller.setCurrentField(0),
                                context: context,
                              ),
                              buildInputField(
                                focusNode: controller
                                    .focusNodes[0], // Pass the focus node
                                controller: controller.userNameController,
                                label: "Username",
                                icon: Icons.alternate_email,
                                index: 0,
                                currentField: controller.currentField,
                                onTap: () => controller.setCurrentField(0),
                                context: context,
                              ),
                              buildInputField(
                                focusNode: controller
                                    .focusNodes[0], // Pass the focus node
                                controller: controller.passwordController,
                                label: "Password",
                                icon: Icons.lock_outline_rounded,
                                index: 0,
                                currentField: controller.currentField,
                                onTap: () => controller.setCurrentField(0),
                                context: context,
                              ),
                            ],
                            mediumBlue: ColorTheme.mediumBlue,
                            accentBlue: ColorTheme.accentBlue,
                            highlightBlue: ColorTheme.highlightBlue,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            "Assigned Services",
                            style: GlobalTextStyles.containerHeadding(context),
                          ),
                          SizedBox(height: 24.h),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 110.h, // Adjust height to fit items
                                child: SingleChildScrollView(
                                  scrollDirection: Axis
                                      .horizontal, // Enable horizontal scrolling
                                  child: Row(
                                    children: [
                                      // **Dummy Containers (Always Visible)**
                                      _buildServiceContainer(context,
                                          "Hair Cut", "Unisex", "20", "10"),
                                      _buildServiceContainer(context, "Facial",
                                          "Women", "50", "10"),
                                      _buildServiceContainer(context, "Massage",
                                          "Men", "30", "10"),

                                      // **Dynamic Containers from Provider**
                                      Consumer<EmployeesAddingController>(
                                        builder: (context, provider, child) {
                                          return Row(
                                            children: provider.selectedServices
                                                .map((service) {
                                              return _buildServiceContainer(
                                                context,
                                                service['name'] ?? "Service",
                                                service['gender'] ?? "Unisex",
                                                service['price'] ?? "N/A",
                                                service['percentage'] ?? "N/A",
                                                removable:
                                                    true, // Allows deletion of dynamic items
                                                onRemove: () {
                                                  Provider.of<EmployeesAddingController>(
                                                          context,
                                                          listen: false)
                                                      .removeService(service);
                                                },
                                              );
                                            }).toList(),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.h),

                              // Positioned Button at the Bottom
                              Positioned(
                                bottom: 24.h, // Distance from the bottom
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Column(
                                    children: [
                                      // First Button: "Add More Services"
                                      Container(
                                        width: double.infinity,
                                        height: 45.h,
                                        margin: EdgeInsets.fromLTRB(
                                            20.w, 10.h, 20.w, 10.h),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF4D9DE0),
                                              Color(0xFF7EDFFF),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF4D9DE0)
                                                  .withOpacity(0.4),
                                              blurRadius: 15,
                                              offset: const Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            print("Add More Services Clicked");
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Add More Services",
                                                  style: GlobalTextStyles
                                                      .buttonText(context)),
                                              SizedBox(width: 8.w),
                                              Icon(Icons.add,
                                                  size: 20.sp,
                                                  color: Colors.white),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                          height:
                                              10.h), // Space between buttons

                                      // Second Button: "Submit" (Or any other action)
                                      Container(
                                        width: double.infinity,
                                        height: 45.h,
                                        margin: EdgeInsets.fromLTRB(
                                            20.w, 10.h, 20.w, 10.h),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF31639C),
                                              Color(0xFF4D9DE0),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF31639C)
                                                  .withOpacity(0.4),
                                              blurRadius: 15,
                                              offset: const Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            print("Submit Clicked");
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(" Check Today's Work",
                                                  style: GlobalTextStyles
                                                      .buttonText(context)),
                                              SizedBox(width: 8.w),
                                              Icon(Icons.work_history_outlined,
                                                  size: 20.sp,
                                                  color: Colors.white),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))))
        ],
      ),
    );
  }

  Widget _buildServiceContainer(
    BuildContext context,
    String name,
    String gender,
    String price,
    String percentage, {
    bool removable = false,
    VoidCallback? onRemove,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Stack(
        children: [
          // **Main Container**
          Container(
            width: 220.w, // Adjust width
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: ColorTheme.mediumBlue.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: ColorTheme.accentBlue.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                      Text(name, style: GlobalTextStyles.saveButton(context)),
                ),
                Expanded(
                  child: Text("Gender: $gender",
                      style: GlobalTextStyles.saveButton(context)),
                ),
                Expanded(
                  child: Text("Price: \$$price",
                      style: GlobalTextStyles.saveButton(context)),
                ),
                Expanded(
                  child: Text("Discount: $percentage%",
                      style: GlobalTextStyles.saveButton(context)),
                ),
              ],
            ),
          ),

          // **Delete Button (Only for dynamic services)**
          //  if (removable)
          Positioned(
            top: 4.h,
            right: 4.w,
            child: GestureDetector(
              onTap: onRemove,
              child:
                  Icon(Icons.delete, color: ColorTheme.accentBlue, size: 20.sp),
            ),
          ),
        ],
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
                          Provider.of<EmployeeDetailsController>(context,
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
