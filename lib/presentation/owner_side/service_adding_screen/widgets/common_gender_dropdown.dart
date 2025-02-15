import 'package:flutter/material.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

class GenderDropdown extends StatelessWidget {
  final TextEditingController controller;

  GenderDropdown({required this.controller});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;

    double borderRadius = isMobile ? 10.r : (isTablet ? 15.r : 20.r);

    // Ensure the dropdown has the same width as other text fields
    double dropdownWidth = isMobile
        ? screenWidth * 0.9
        : (isTablet ? screenWidth * 0.85 : screenWidth * 0.8);

    return SizedBox(
      width: dropdownWidth, // Matches text field width
      child: DropdownButtonFormField<String>(
        value: controller.text.isEmpty ? null : controller.text,
        isExpanded: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorTheme.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
        items:
            ["Select Gender", "Male", "Female", "Other"].map((String gender) {
          return DropdownMenuItem<String>(
            value: gender == "Select Gender" ? null : gender,
            child: Text(
              gender,
              style: GlobalTextStyles.dropdownText(context),
              overflow: TextOverflow.ellipsis, // Ensures text fits
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.text = newValue ?? '';
        },
      ),
    );
  }
}
