import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

class CommonTextFormField extends StatelessWidget {
  final String hintText;

  CommonTextFormField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;

    return TextFormField(
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.top,
      style: GlobalTextStyles.textFormfieldStyle(context),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.blueGrey,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(isMobile ? 10.r : (isTablet ? 10.r : 10.r)),
          borderSide: BorderSide(color: ColorTheme.maincolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(isMobile ? 10.r : (isTablet ? 10.r : 10.r)),
          borderSide: BorderSide(color: ColorTheme.white.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(isMobile ? 10.r : (isTablet ? 10.r : 10.r)),
          borderSide: BorderSide(color: ColorTheme.white, width: 2),
        ),
        hintStyle:
            GlobalTextStyles.hintStyle(context).copyWith(color: Colors.grey),
      ),
    );
  }
}
