import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_styles.dart';
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

    return Scaffold(
      backgroundColor: ColorTheme.black,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A2151),
                  Color(0xFF0D1137),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: padding, right: padding, top: 50.h),
              child: Consumer<AddServiceController>(
                builder: (context, provider, child) {
                  return Form(
                    key: provider.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    // Service Image Header
                    Center(
                    child: Column(
                    children: [
                      Container(
                      height: 80.sp,
                      width: 80.sp,
                      decoration: BoxDecoration(
                        color: ColorTheme.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(60.r),
                      ),
                      child: Icon(
                        Icons.spa,
                        size: 40.sp,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: isMobile ? 10.h : 20.h),
                    Text(
                      "Add New Service",
                      style: TextStyle(
                          color: ColorTheme.white,
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
                  color: ColorTheme.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(height: isMobile ? 10.h : 20.h),
                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                  ) ],
                  ),
                  child: TextFormField(
                  controller: provider.serviceNameController,
                  decoration: InputDecoration(
                  hintText: "Enter service name",
                  hintStyle: TextStyle(color: ColorTheme.white),
                  prefixIcon: Icon(Icons.volunteer_activism,
                  color: ColorTheme.white),
                  border: InputBorder.none, // Removes the default border
                  ),
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Please enter a service name';
                  }
                  return null;
                  },
                  ),
                  ),
                  SizedBox(height: isMobile ? 10.h : 20.h),

                  // Category Selection
                  Text(
                  "Category",
                  style: TextStyle(
                  color: ColorTheme.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(height: isMobile ? 10.h : 20.h),
                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                  color: ColorTheme.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                  ) ],
                  ),
                  child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                  isExpanded: true, // Ensures the dropdown takes the full width
                  value: provider.selectedCategory,
                  icon: Icon(Icons.keyboard_arrow_down,
                  color: ColorTheme.white),
                  iconSize: 24.h,
                  elevation: 1,
                  style: TextStyle(
                  color: ColorTheme.white,
                  fontSize: 16,
                  ),
                  dropdownColor: Colors.blueGrey, // Set the background color of the dropdown menu
                  onChanged: (String? newValue) {
                  provider.setSelectedCategory(newValue!);
                  },
                  items: provider.categories
                      .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                  mainAxisSize: MainAxisSize.min, // Ensures Row takes only necessary space
                  children: [
                  Icon(
                  _getCategoryIcon(value),
                  color: ColorTheme.white,
                  size: 20.h,
                  ),
                  SizedBox(width: 12.w),
                  Expanded( // Ensures text takes remaining space
                  child: Text(
                  value,
                  style: TextStyle(color: ColorTheme.white),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
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
                  color: ColorTheme.white,
                  fontWeight: FontWeight.w500,
                  ),
                  ),
                  SizedBox(height: isMobile ? 10.h : 20.h),
                  Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                  color: ColorTheme.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                  ),
                  ],
                  ),
                  child: TextFormField(
                  controller: provider.priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  hintText: "Enter price",
                  hintStyle: TextStyle(color: ColorTheme.white),
                  prefixIcon: Icon(Icons.attach_money,
                  color: ColorTheme.white),
                  border: InputBorder.none, // Removes the default border
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
                  color: ColorTheme.white,
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
                  selectedColor: Colors.teal,
                  backgroundColor: ColorTheme.white.withOpacity(0.1),
                  onSelected: (selected) {
                  provider.setSelectedGender(gender);
                  },
                  labelStyle: TextStyle(
                  color: provider.selectedGender == gender
                  ? ColorTheme.white
                      : Colors.teal,
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

          // Fixed Buttons at the Bottom
          Positioned(
            left: padding,
            right: padding,
            bottom: 20.h,
            child: Consumer<AddServiceController>(
              builder: (context, provider, child) {
                return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => provider.saveService(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: ColorTheme.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => provider.saveAndAddNew(context),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          backgroundColor: ColorTheme.white,
                          foregroundColor: ColorTheme.maincolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: ColorTheme.darkcolor),
                          ),
                        ),
                        child: Text(
                          "Save & New",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorTheme.darkcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
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