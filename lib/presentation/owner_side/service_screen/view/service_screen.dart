import 'package:flutter/material.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/service_screen/widgets/serach_bar.dart';
import 'package:salonrabcode/presentation/owner_side/service_screen/widgets/service_category_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceScreen extends StatelessWidget {
  final List<String> services = [
    'Haircut',
    'Shaving',
    'Hair Spa',
    'Facial',
    'Manicure',
    'Pedicure',
    'Massage',
    'Haircut',
    'Shaving',
    'Hair Spa',
    'Facial',
    'Manicure',
    'Pedicure',
    'Massage',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;

    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    double aspectRatio = isMobile ? 2 : (isTablet ? 1.8 : 1.6);
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: GlobalTextStyles.appBarHeadding(context),
        ),
        backgroundColor: ColorTheme.white,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Salon Services",
              style: GlobalTextStyles.subHeadding(context),
            ),
            SizedBox(height: isMobile ? 10.h : 20.h),
            SearchBarSalon(hintText: 'Search Services',),
            SizedBox(height: isMobile ? 10.h : 20.h),
            Expanded(
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Adjust dynamically
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: aspectRatio, // Fixed for better visibility
                ),
                itemBuilder: (context, index) {
                  return ServiceCategoryContainer(
                    name: services[index],
                    isMobile: isMobile,
                    isTablet: isTablet,
                    isLaptop: isLaptop,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("FAB Pressed");
        },
        backgroundColor: ColorTheme.maincolor, // Use your theme color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r), // Adjust radius
        ),
        label: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16.w, vertical: 10.h), // Adjust padding
          child: Text(
            "Add Service",
            style: GlobalTextStyles.floatingButtonText(context),
          ),
        ),
      ),
    );
  }
}
