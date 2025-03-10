import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      isScrollControlled: true, // Allow the bottom sheet to take more height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5, // Start at 50% of the screen height
          minChildSize: 0.3, // Minimum height is 30% of screen height
          maxChildSize: 0.9, // Maximum height is 90% of screen height
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.teal[900],
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
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
                    style: GlobalTextStyles.serviceContainer(context),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: services
                            .map((service) =>
                                _buildServiceItem(context, service))
                            .toList(),
                      ),
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
      child: AspectRatio(
        aspectRatio:
            isMobile ? 2.5 : (isTablet ? 3 : 3.5), // Adjust aspect ratio

        child: Container(
          width: (MediaQuery.of(context).size.width / 2) - 24.w,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
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
              Text(service['name'] ?? "Service",
                  style: GlobalTextStyles.floatingButtonText(context)),
              SizedBox(height: 4.h),
              Text("Gender: ${service['gender'] ?? "Unisex"}",
                  style: GlobalTextStyles.floatingButtonText(context)),
              SizedBox(height: 4.h),
              Text("Price: \$${service['price'] ?? "0"}",
                  style: GlobalTextStyles.floatingButtonText(context)),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: ColorTheme.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding = isMobile ? 12.w : (isTablet ? 16.w : 20.w);
    double radius = isMobile ? 12.r : (isTablet ? 18.r : 24.r);

    return GestureDetector(
      onTap: () => _showServiceDetails(context),
      child: AspectRatio(
          aspectRatio: isMobile ? 2.5 : (isTablet ? 3 : 3.5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10.h),
            decoration: BoxDecoration(
              color: ColorTheme.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5.r,
                  spreadRadius: 2.r,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: GlobalTextStyles.serviceContainer(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Your delete function here
                    print("Delete $name");
                  },
                  child: Icon(Icons.delete, color: Colors.teal, size: 20.sp),
                ),
              ],
            ),
          )),
    );
  }
}
