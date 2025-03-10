import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

class SearchBarSalon extends StatelessWidget {
  final String hintText; // 👈 Accepting hint text dynamically

  const SearchBarSalon({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;

    double horizontalPadding = isMobile ? 16.w : (isTablet ? 12.w : 3.w);
    double verticalPadding = isMobile ? 8.h : (isTablet ? 8.h : 3.h);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: ColorTheme.white.withOpacity(0.1),
        borderRadius:
            BorderRadius.circular(isMobile ? 30.r : (isTablet ? 10.r : 10.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        style:
            TextStyle(fontSize: isMobile ? 14.sp : (isTablet ? 14.sp : 14.sp)),
        decoration: InputDecoration(
          icon:
              Icon(Icons.search, color: ColorTheme.white), // Prefix search icon
          hintText: hintText, // 👈 Custom hint text for each screen
          border: InputBorder.none,
          hintStyle: GlobalTextStyles.hintStyle(context),
        ),
      ),
      // GestureDetector(
      //   onTap: () {
      //     // Add button action here
      //   },
      //   child: Icon(
      //     Icons.search,
      //     color: ColorTheme.maincolor,
      //     size: isMobile ? 20.sp : (isTablet ? 20.sp : 15.sp),
      //   ),
      // ),
    );
  }
}
