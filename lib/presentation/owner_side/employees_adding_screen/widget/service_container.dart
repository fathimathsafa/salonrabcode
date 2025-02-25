import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/controller/employees_adding_controller.dart';

class ServiceContainer extends StatelessWidget {
  final String name;
  final bool isMobile;
  final bool isTablet;
  final bool isLaptop;
  final List<Map<String, String>> services;
  final Function(Map<String, String>) onSelectService; // ✅ Added this

  ServiceContainer({
    required this.name,
    required this.isMobile,
    required this.isTablet,
    required this.isLaptop,
    required this.services,
    required this.onSelectService, // ✅ Ensure this is required
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
                            .map((service) => _buildServiceItem(context, service))
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
  final selectedServices = Provider.of<SelectedServiceProvider>(context).selectedServices;
  bool isSelected = selectedServices.any((s) => s['name'] == service['name']); // ✅ Check if selected

  return GestureDetector(
    onTap: () {
      Provider.of<SelectedServiceProvider>(context, listen: false).selectService(service);
      Navigator.pop(context); // ✅ Close bottom sheet
    },
    child: Container(
      width: (MediaQuery.of(context).size.width / 2) - 24.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isSelected ? ColorTheme.maincolor.withOpacity(0.3) : ColorTheme.maincolor, // ✅ Change color
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
          child: Text(
            name,
            style: GlobalTextStyles.serviceContainer(context),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
