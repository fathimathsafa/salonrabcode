import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/core/common/widget/serach_bar.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/view/employees_adding_screen.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/view/service_adding_screen.dart';
import 'package:salonrabcode/presentation/owner_side/service_screen/widgets/service_category_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> serviceCategories = [
    {
      "category": "Haircut",
      "services": [
        {"name": "Men's Haircut", "gender": "Male", "price": "20"},
        {"name": "Women's Haircut", "gender": "Female", "price": "30"},
        {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
        {"name": "Men's Haircut", "gender": "Male", "price": "20"},
        {"name": "Women's Haircut", "gender": "Female", "price": "30"},
        {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
        {"name": "Men's Haircut", "gender": "Male", "price": "20"},
        {"name": "Women's Haircut", "gender": "Female", "price": "30"},
        {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
        {"name": "Men's Haircut", "gender": "Male", "price": "20"},
        {"name": "Women's Haircut", "gender": "Female", "price": "30"},
        {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
        {"name": "Men's Haircut", "gender": "Male", "price": "20"},
        {"name": "Women's Haircut", "gender": "Female", "price": "30"},
        {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
      ]
    },
    {
      "category": "Shaving",
      "services": [
        {"name": "Beard Trim", "gender": "Male", "price": "10"},
        {"name": "Clean Shave", "gender": "Male", "price": "15"},
      ]
    },
    {
      "category": "Hair Spa",
      "services": [
        {"name": "Keratin Treatment", "gender": "Unisex", "price": "50"},
        {"name": "Deep Conditioning", "gender": "Unisex", "price": "40"},
      ]
    },
    {
      "category": "Facial",
      "services": [
        {"name": "Basic Facial", "gender": "Unisex", "price": "25"},
        {"name": "Anti-Aging Facial", "gender": "Unisex", "price": "40"},
      ]
    },
    {
      "category": "Manicure",
      "services": [
        {"name": "Classic Manicure", "gender": "Unisex", "price": "20"},
        {"name": "Gel Manicure", "gender": "Unisex", "price": "30"},
      ]
    },
    {
      "category": "Pedicure",
      "services": [
        {"name": "Regular Pedicure", "gender": "Unisex", "price": "25"},
        {"name": "Spa Pedicure", "gender": "Unisex", "price": "35"},
      ]
    },
    {
      "category": "Massage",
      "services": [
        {"name": "Full Body Massage", "gender": "Unisex", "price": "50"},
        {"name": "Head Massage", "gender": "Unisex", "price": "20"},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth <= 600;
    bool isTablet = screenWidth > 600 && screenWidth <= 1024;
    bool isLaptop = screenWidth > 1024;

    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    double aspectRatio = isMobile ? 2 : (isTablet ? 1.8 : 1.6);
    double padding = isMobile ? 10.w : (isTablet ? 20.w : 10.w);
    final darkBlue = const Color(0xFF0A1128);
    final mediumBlue = const Color(0xFF1C2E4A);
    final lightBlue = const Color(0xFF31639C);
    final accentBlue = const Color(0xFF4D9DE0);
    final highlightBlue = const Color(0xFF7EDFFF);
    return Scaffold(
      backgroundColor: darkBlue,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: TextStyle(
            color: highlightBlue,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 20.sp : (isTablet ? 16.sp : 12.sp),
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
          child: CustomPaint(
            size: Size.infinite, // Covers the entire screen
            painter: BackgroundPainter(
              darkBlue: Color(0xFF0A1128),
              mediumBlue: Color(0xFF1C2E4A),
              lightBlue: Color(0xFF31639C),
              accentBlue: Color(0xFF4D9DE0),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: accentBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.spa,
                        color: highlightBlue,
                        size: isMobile ? 24.sp : 18.sp,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        "Your Salon Services",
                        style: GoogleFonts.urbanist(
                          color: highlightBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 18.sp : 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isMobile ? 15.h : 20.h),
                SearchBarSalon(
                  hintText: 'Search Service',
                ),
                SizedBox(height: isMobile ? 15.h : 20.h),
                Expanded(
                  child: GridView.builder(
                    itemCount: serviceCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount, // Adjust dynamically
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio:
                          aspectRatio, // Fixed for better visibility
                    ),
                    itemBuilder: (context, index) {
                      return ServiceCategoryContainer(
                        name: serviceCategories[index]['category'],
                        isMobile: isMobile,
                        isTablet: isTablet,
                        isLaptop: isLaptop,
                        services: List<Map<String, String>>.from(
                            serviceCategories[index]['services']),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddServiceScreen()));
        },
        backgroundColor: accentBlue, // Use your theme color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r), // Adjust radius
        ),
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Text(
            "Add Service",
            style: GlobalTextStyles.floatingButtonText(context),
          ),
        ),
      ),
    );
  }
}
