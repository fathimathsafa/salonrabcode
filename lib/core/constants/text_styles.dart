import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonrabcode/core/constants/colors.dart';

class GlobalTextStyles {
  static TextStyle appBarHeadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 5.sp,
          fontWeight: FontWeight.bold,
          color: ColorTheme.maincolor);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: ColorTheme.maincolor);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorTheme.maincolor);
    }
  }

  static TextStyle subHeadding(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize: (MediaQuery.of(context).size.width > 1024)
          ? 5.sp // Laptop
          : (MediaQuery.of(context).size.width > 600)
              ? 10.sp // Tablet
              : 20.sp, // Mobile
      fontWeight: FontWeight.bold,
      color: ColorTheme.maincolor,
    );
  }

  static TextStyle hintStyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 5.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    }
  }

  static TextStyle serviceContainer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.black);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.black);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.black);
    }
  }

  static TextStyle floatingButtonText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    }
  }

  static TextStyle bottomNavigationText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    }
  }

  static TextStyle textFormfieldHead(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 5.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    }
  }

  static TextStyle textFormfieldStyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.lightgrey);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.lightgrey);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.lightgrey);
    }
  }

  static TextStyle dropdownText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 5.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.lightgrey);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.lightgrey);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.lightgrey);
    }
  }

  static TextStyle saveAndNewButtonText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 5.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.black);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.black);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.black);
    }
  }

  static TextStyle saveButtonText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 5.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    }
  }
}
