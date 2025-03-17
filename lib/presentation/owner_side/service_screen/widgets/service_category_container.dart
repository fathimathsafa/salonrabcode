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
            Expanded(
              child: Text(service['name'] ?? "Service",
                  style: GlobalTextStyles.floatingButtonText(context)),
            ),
            Text("Gender: ${service['gender'] ?? "Unisex"}",
                style: GlobalTextStyles.floatingButtonText(context)),
            Text("Price: \$${service['price'] ?? "0"}",
                style: GlobalTextStyles.floatingButtonText(context)),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.delete, color: ColorTheme.red),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accentBlue = const Color(0xFF4D9DE0);
    final highlightBlue = const Color(0xFF7EDFFF);
    double padding = isMobile ? 12.w : (isTablet ? 16.w : 20.w);

    return GestureDetector(
      onTap: () => _showServiceDetails(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10.h),
        decoration: BoxDecoration(
          color: accentBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
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
                print("Delete $name");
              },
              child: Icon(Icons.delete, color: highlightBlue, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
