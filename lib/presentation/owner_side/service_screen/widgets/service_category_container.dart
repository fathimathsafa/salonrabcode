import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/service_details_screen/view/service_details_screen.dart';

class ServiceCategoryContainer extends StatelessWidget {
  final String name;
  final bool isMobile;
  final bool isTablet;
  final bool isLaptop;
  final List<Map<String, String>> services;

  ServiceCategoryContainer({
    required this.name,
    required this.isMobile,
    required this.isTablet,
    required this.isLaptop,
    required this.services,
  });

  void _showServiceDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: ColorTheme.mediumBlue,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5.r,
                    spreadRadius: 2.r,
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: GlobalTextStyles.hintAndCategoryText(context),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two items per row
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: isMobile ? 1.8 : (isTablet ? 2 : 2.5),
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return _buildServiceItem(context, services[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildServiceItem(BuildContext context, Map<String, String> service) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ServiceDetailsScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: ColorTheme.white.withOpacity(0.1),
              blurRadius: 5.r,
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(service['name'] ?? "Service",
                  style: GlobalTextStyles.hintAndCategoryText(context)),
            ),
            Expanded(
              child: Text("Gender: ${service['gender'] ?? "Unisex"}",
                  style: GlobalTextStyles.hintAndCategoryText(context)),
            ),
            Expanded(
              child: Text("Price: \$${service['price'] ?? "0"}",
                  style: GlobalTextStyles.hintAndCategoryText(context)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding = isMobile ? 12.w : (isTablet ? 16.w : 20.w);

    return GestureDetector(
      onTap: () => _showServiceDetails(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorTheme.accentBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: GlobalTextStyles.hintAndCategoryText(context),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                _showDeleteConfirmationDialog(context);
              },
              child: Icon(Icons.delete,
                  color: ColorTheme.highlightBlue, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r), // Responsive border radius
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
