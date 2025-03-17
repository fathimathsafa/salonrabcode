import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import '../../../../core/common/painters/background_painter.dart';
import '../controller/service_adding_controller.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);

    // Create FocusNodes for each field
    FocusNode serviceNameFocusNode = FocusNode();
    FocusNode categoryFocusNode = FocusNode();
    FocusNode priceFocusNode = FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.darkBlue,
      body: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(left: padding, right: padding, top: 50.h),
              child: Consumer<AddServiceController>(
                builder: (context, provider, child) {
                  return Form(
                    key: provider.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Button
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Navigate back
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: ColorTheme.mediumBlue.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: ColorTheme.accentBlue.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 24.sp,
                              color: ColorTheme.highlightBlue,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // Service Image Header
                        Center(
                          child: Column(
                            children: [
                              Container(
                                height: 80.sp,
                                width: 80.sp,
                                decoration: BoxDecoration(
                                  color: ColorTheme.mediumBlue.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(60.r),
                                  border: Border.all(
                                    color:
                                        ColorTheme.accentBlue.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.spa,
                                  size: 40.sp,
                                  color: ColorTheme.highlightBlue,
                                ),
                              ),
                              SizedBox(height: isMobile ? 10.h : 20.h),
                              Text(
                                "Add New Service",
                                style: TextStyle(
                                    color: ColorTheme.highlightBlue,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),

                        // Service Name Field
                        Text(
                          "Service Name",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isMobile ? 10.h : 20.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: ColorTheme.mediumBlue.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: ColorTheme.accentBlue.withOpacity(0.3),
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
                          child: TextFormField(
                            focusNode: serviceNameFocusNode,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.white),
                            controller: provider.serviceNameController,
                            decoration: InputDecoration(
                              hintText: "Enter service name",
                              hintStyle: TextStyle(color: Colors.white38),
                              prefixIcon: Icon(Icons.volunteer_activism,
                                  color: ColorTheme.highlightBlue
                                      .withOpacity(0.7)),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a service name';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(categoryFocusNode);
                            },
                          ),
                        ),
                        SizedBox(height: isMobile ? 10.h : 20.h),

                        // Category Selection
                        Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isMobile ? 10.h : 20.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: ColorTheme.mediumBlue.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: ColorTheme.accentBlue.withOpacity(0.3),
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
                                    .requestFocus(priceFocusNode);
                              },
                              items: provider.categories
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        _getCategoryIcon(value),
                                        color: ColorTheme.highlightBlue
                                            .withOpacity(0.7),
                                        size: 20.h,
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: isMobile ? 10.h : 20.h),

                        // Price Field
                        Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isMobile ? 10.h : 20.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: ColorTheme.mediumBlue.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: ColorTheme.accentBlue.withOpacity(0.3),
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
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            focusNode: priceFocusNode,
                            controller: provider.priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter price",
                              hintStyle: TextStyle(color: Colors.white38),
                              prefixIcon: Icon(Icons.attach_money,
                                  color: ColorTheme.highlightBlue
                                      .withOpacity(0.7)),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a price';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: isMobile ? 10.h : 20.h),

                        // Gender Selection
                        Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: isMobile ? 10.h : 20.h),
                        Wrap(
                          spacing: 12.0,
                          children: provider.genders.map((gender) {
                            return ChoiceChip(
                              label: Text(gender),
                              selected: provider.selectedGender == gender,
                              selectedColor: ColorTheme.accentBlue,
                              backgroundColor:
                                  ColorTheme.mediumBlue.withOpacity(0.8),
                              onSelected: (selected) {
                                provider.setSelectedGender(gender);
                              },
                              labelStyle: TextStyle(
                                color: provider.selectedGender == gender
                                    ? Colors.white
                                    : ColorTheme.highlightBlue,
                                fontWeight: provider.selectedGender == gender
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 190.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
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
                    // Add save and new logic here
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: ColorTheme.highlightBlue,
                    size: 20.sp,
                  ),
                  label: Text(
                    "SAVE & NEW",
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
                    )
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add save logic here
                  },
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  label: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12.sp,
                    ),
                  ),
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

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Hair':
        return Icons.content_cut;
      case 'Facial':
        return Icons.face;
      case 'Nails':
        return Icons.brush;
      case 'Massage':
        return Icons.airline_seat_flat;
      case 'Makeup':
        return Icons.face_retouching_natural;
      case 'Spa':
        return Icons.spa;
      default:
        return Icons.spa;
    }
  }
}
