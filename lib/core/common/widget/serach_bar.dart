import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

class SearchBarSalon extends StatelessWidget {
  final String hintText; // 👈 Accepting hint text dynamically

  const SearchBarSalon({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    // Dark blue color palette from AddBranchesScreen
    final darkBlue = const Color(0xFF0A1128);
    final mediumBlue = const Color(0xFF1C2E4A);
    final lightBlue = const Color(0xFF31639C);
    final accentBlue = const Color(0xFF4D9DE0);
    final highlightBlue = const Color(0xFF7EDFFF);
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
        color: accentBlue.withOpacity(0.2),
        borderRadius:
            BorderRadius.circular(isMobile ? 10.r : (isTablet ? 10.r : 10.r)),
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
        style: GlobalTextStyles.hintAndCategoryText(context),
        decoration: InputDecoration(
          icon:
              Icon(Icons.search, color: ColorTheme.white), // Prefix search icon
          hintText: hintText, // 👈 Custom hint text for each screen
          border: InputBorder.none,
          hintStyle: GlobalTextStyles.hintAndCategoryText(context),
        ),
      ),
    );
  }
}
