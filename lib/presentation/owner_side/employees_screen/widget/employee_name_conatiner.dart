import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';

class EmpllooyeeNameContainer extends StatelessWidget {
  final String name;
  final bool isMobile;
  final bool isTablet;
  final bool isLaptop;

  EmpllooyeeNameContainer({
    required this.name,
    required this.isMobile,
    required this.isTablet,
    required this.isLaptop,
  });
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Are you sure you want to delete \"$name\"?",
            style: GlobalTextStyles.serviceContainer(context),
          ),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                "No",
                style: GlobalTextStyles.serviceContainer(context),
              ),
            ),

            // Delete Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                "Yes",
                style: GlobalTextStyles.serviceContainer(context),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding = isMobile ? 12.w : (isTablet ? 16.w : 20.w);
    double radius = isMobile ? 12.r : (isTablet ? 18.r : 24.r);
    double height = isMobile ? 80.h : (isTablet ? 100.h : 120.h);
    double width = isMobile ? 150.w : (isTablet ? 180.w : 200.w);

    return AspectRatio(
      aspectRatio: isMobile ? 2.5 : (isTablet ? 3 : 3.5), // Adjust aspect ratio
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10.r,
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                name,
                style: GlobalTextStyles.serviceContainer(context),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
                onPressed: () => _showDeleteConfirmation(context),
                icon: Icon(
                  Icons.delete,
                  size: 25.sp,
                  color: ColorTheme.maincolor,
                ))
          ],
        ),
      ),
    );
  }
}
