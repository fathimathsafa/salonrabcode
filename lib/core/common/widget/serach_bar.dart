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

    double horizontalPadding = isMobile ? 12.w : (isTablet ? 12.w : 3.w);
    double verticalPadding = isMobile ? 8.h : (isTablet ? 8.h : 3.h);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: ColorTheme.maincolor,
        borderRadius:
            BorderRadius.circular(isMobile ? 10.r : (isTablet ? 10.r : 10.r)),
        boxShadow: [
          BoxShadow(color: Colors.white, offset: Offset(-3, -3), blurRadius: 5),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(3, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(
                  fontSize: isMobile ? 14.sp : (isTablet ? 14.sp : 14.sp)),
              decoration: InputDecoration(
                hintText: hintText, // 👈 Custom hint text for each screen
                border: InputBorder.none,
                hintStyle: GlobalTextStyles.hintStyle(context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Add button action here
            },
            child: Container(
              width: isMobile ? 36.w : (isTablet ? 48.w : 60.w),
              height: isMobile ? 36.h : (isTablet ? 48.h : 60.h),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2, -2),
                      blurRadius: 4),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                Icons.search,
                color: ColorTheme.maincolor,
                size: isMobile ? 20.sp : (isTablet ? 20.sp : 15.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
