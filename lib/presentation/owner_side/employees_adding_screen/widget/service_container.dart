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
  final Function(Map<String, String>) onSelectService;

  ServiceContainer({
    required this.name,
    required this.isMobile,
    required this.isTablet,
    required this.isLaptop,
    required this.services,
    required this.onSelectService,
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
    final selectedServices =
        Provider.of<EmployeesAddingController>(context).selectedServices;
    bool isSelected = selectedServices.any((s) => s['name'] == service['name']);

    return GestureDetector(
      onTap: () {
        onSelectService(
            service); // ✅ Calls the function to update selected services
        Navigator.pop(context);
      },
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 24.w,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    ColorTheme.white.withOpacity(0.1),
                    Colors.black.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    Color(0xFF1A2151),
                    Color(0xFF0D1137),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(12.r),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showServiceDetails(context),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorTheme.accentBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          name,
          style: GlobalTextStyles.serviceContainer(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
