import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employee_details_screen/view/employee_details_screen.dart';

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

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16.r), // Responsive border radius
          ),
          backgroundColor: Color(0xFF1C2E4A), // Custom background color
          child: Padding(
            padding: EdgeInsets.all(20.w), // Responsive padding
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevent unnecessary space
              children: [
                Text("Delete Category",
                    style: GlobalTextStyles.alertBoxText(context)),
                SizedBox(height: 10.h), // Responsive spacing
                Text(
                  "Are you sure you want to delete this category?",
                  style: GlobalTextStyles.alertBoxSUBText(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h), // Responsive spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // No button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.r), // Responsive border radius
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 20.w), // Responsive padding
                        ),
                        child: Text(
                          "No",
                          style: GlobalTextStyles.hintAndCategoryText(
                              context), // Responsive font size
                        ),
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          print(
                              "Category deleted"); // Replace with actual delete logic
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Yes button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.r), // Responsive border radius
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 20.w), // Responsive padding
                        ),
                        child: Text("Yes",
                            style: GlobalTextStyles.hintAndCategoryText(
                                context) // Responsive font size
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding = isMobile ? 12.w : (isTablet ? 16.w : 20.w);

    return AspectRatio(
      aspectRatio: isMobile ? 2.5 : (isTablet ? 3 : 3.5), // Adjust aspect ratio
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EmployeeDetailsScreen()));
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10.h),
          decoration: BoxDecoration(
            color: ColorTheme.accentBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.r),
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
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 20.sp,
                    color: ColorTheme.highlightBlue,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
