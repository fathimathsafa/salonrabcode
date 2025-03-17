import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonrabcode/core/constants/colors.dart';

class GlobalTextStyles {
  static TextStyle appBarHeading(BuildContext context) {
    double scaleFactor =
        ScreenUtil().scaleText; // Gets scale based on screen size

    return GoogleFonts.urbanist(
      fontSize: (18 * scaleFactor).sp, // Adjust based on device scale
      fontWeight: FontWeight.bold,
      color: ColorTheme.highlightBlue,
    );
  }

  static TextStyle subHeading(BuildContext context) {
    double scaleFactor =
        ScreenUtil().scaleText; // Gets scale based on screen size

    return GoogleFonts.urbanist(
      fontSize: (15 * scaleFactor).sp, // Adjust based on device scale
      fontWeight: FontWeight.bold,
      color: ColorTheme.highlightBlue,
    );
  }

  static TextStyle hintAndCategoryText(BuildContext context) {
    double scaleFactor =
        ScreenUtil().scaleText; // Gets scale based on screen size

    return GoogleFonts.urbanist(
      fontSize: (14 * scaleFactor).sp, // Adjust based on device scale
      fontWeight: FontWeight.normal,
      color: ColorTheme.white,
    );
  }

  static TextStyle alertBoxText(BuildContext context) {
    double scaleFactor =
        ScreenUtil().scaleText; // Gets scale based on screen size

    return GoogleFonts.urbanist(
      fontSize: (18 * scaleFactor).sp, // Adjust based on device scale
      fontWeight: FontWeight.normal,
      color: ColorTheme.white,
    );
  }

  static TextStyle alertBoxSUBText(BuildContext context) {
    double scaleFactor =
        ScreenUtil().scaleText; // Gets scale based on screen size

    return GoogleFonts.urbanist(
      fontSize: (14 * scaleFactor).sp, // Adjust based on device scale
      fontWeight: FontWeight.normal,
      color: ColorTheme.white,
    );
  }

  static TextStyle appBarHeadding1(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1024) {
      // Laptop
      return GoogleFonts.urbanist(
          fontSize: 5.sp, fontWeight: FontWeight.bold, color: ColorTheme.white);
    } else if (screenWidth > 600) {
      // Tablet
      return GoogleFonts.urbanist(
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: ColorTheme.white);
    } else {
      // Mobile
      return GoogleFonts.urbanist(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: ColorTheme.white);
    }
  }

  static TextStyle subHeadding1(BuildContext context) {
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
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
          color: ColorTheme.white);
    }
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
