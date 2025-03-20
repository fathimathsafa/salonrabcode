import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/common/painters/background_painter.dart';
import 'package:salonrabcode/core/common/widget/serach_bar.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/add_service_employee_editing_screen/controller/add_service_employee_editing_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/add_service_employee_editing_screen/widgets/edit_service_container.dart';

class AddServiceEmployeeEditingScreen extends StatelessWidget {
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
    double screenWidth = ScreenUtil().screenWidth;
    bool isMobile = screenWidth <= 600.w;
    bool isTablet = screenWidth > 600.w && screenWidth <= 1024.w;
    bool isLaptop = screenWidth > 1024;

    double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);
    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    double aspectRatio = isMobile ? 2 : (isTablet ? 1.8 : 1.6);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height, // Full screen height
            width: MediaQuery.of(context).size.width, // Full screen width
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: ColorTheme.accentBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.spa,
                            color: ColorTheme.highlightBlue,
                            size: isMobile ? 24.sp : 18.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text("Service List",
                              style: GlobalTextStyles.subHeading(context)),
                        ],
                      ),
                      Text(
                        "Add more service for your employee",
                        style: GlobalTextStyles.hintAndCategoryText(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                _buildFormSection(
                  context,
                  title: "Employee Details",
                  icon: Icons.person_2_outlined,
                  fields: [
                    Text(
                      "Employee Name = Arun",
                      style: GlobalTextStyles.hintAndCategoryText(context),
                    ),
                    Text(
                      "Username = asdghg",
                      style: GlobalTextStyles.hintAndCategoryText(context),
                    ),
                    Text(
                      "Password = 123456",
                      style: GlobalTextStyles.hintAndCategoryText(context),
                    ),
                  ],
                  mediumBlue: ColorTheme.mediumBlue,
                  accentBlue: ColorTheme.accentBlue,
                  highlightBlue: ColorTheme.highlightBlue,
                ),
                SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<AddServiceEmployeeEditingScreenController>(
                      builder: (context, provider, child) {
                        if (provider.selectedServices.isEmpty) {
                          return SizedBox
                              .shrink(); // Hide if no services selected
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Selected Services",
                              style:
                                  GlobalTextStyles.containerHeadding(context),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 130
                                  .h, // Increased height to fit the custom TextFormField
                              child: SingleChildScrollView(
                                scrollDirection:
                                    Axis.horizontal, // Enable horizontal scroll
                                child: Row(
                                  children:
                                      provider.selectedServices.map((service) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 220
                                                .w, // Adjust width to fit content properly
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 8.h),
                                            decoration: BoxDecoration(
                                              color: ColorTheme.accentBlue,
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    service['name'] ??
                                                        "Service",
                                                    style: GlobalTextStyles
                                                        .hintAndCategoryText(
                                                            context),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "Gender: ${service['gender'] ?? 'Unisex'}",
                                                    style: GlobalTextStyles
                                                        .saveButton(context),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "Price: \$${service['price'] ?? 'N/A'}",
                                                    style: GlobalTextStyles
                                                        .saveButton(context),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: _buildSmallFormField(
                                                    context,
                                                    hint: "Enter percentage",
                                                    icon: Icons.percent,
                                                    mediumBlue:
                                                        ColorTheme.mediumBlue,
                                                    accentBlue:
                                                        ColorTheme.accentBlue,
                                                    highlightBlue: ColorTheme
                                                        .highlightBlue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Delete Button (Positioned at the top-right corner)
                                          Positioned(
                                            top: 4.h,
                                            right: 4.w,
                                            child: GestureDetector(
                                              onTap: () {
                                                Provider.of<AddServiceEmployeeEditingScreenController>(
                                                        context,
                                                        listen: false)
                                                    .removeService(service);
                                              },
                                              child: Icon(Icons.delete,
                                                  color: ColorTheme.darkBlue,
                                                  size: 18.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                SearchBarSalon(
                  hintText: 'Search Service',
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  height: 300.h, // Set a height for GridView
                  child: GridView.builder(
                    itemCount: serviceCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: aspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return EditServiceContainer(
                        name: serviceCategories[index]['category'],
                        isMobile: isMobile,
                        isTablet: isTablet,
                        isLaptop: isLaptop,
                        services: List<Map<String, String>>.from(
                            serviceCategories[index]['services']),
                        onSelectService: (service) {
                          Provider.of<AddServiceEmployeeEditingScreenController>(
                                  context,
                                  listen: false)
                              .selectService(service);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorTheme.darkBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            // SAVE & NEW Button
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorTheme.accentBlue,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close_fullscreen,
                    color: ColorTheme.highlightBlue,
                    size: 20.sp,
                  ),
                  label: Text("DON'T SAVE",
                      style: GlobalTextStyles.saveAndNewButton(context)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            // SAVE Button
            Expanded(
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorTheme.accentBlue,
                      ColorTheme.highlightBlue,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme.accentBlue.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  label:
                      Text("SAVE", style: GlobalTextStyles.saveButton(context)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallFormField(
    BuildContext context, {
    required String hint,
    required IconData icon,
    required Color mediumBlue,
    required Color accentBlue,
    required Color highlightBlue,
  }) {
    return Container(
      height: 36.h, // Compact height
      decoration: BoxDecoration(
        color: mediumBlue.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.r), // Smooth rounded corners
        border: Border.all(
          color: accentBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Icon(
              icon,
              color: ColorTheme.white,
              size: 16.sp, // Small icon
            ),
          ),
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.left, // Center text horizontally
              style: TextStyle(fontSize: 12.sp), // Smaller text
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.urbanist(
                    fontSize: 10.sp, color: Colors.white), // Smaller hint text
                border: InputBorder.none, // No default border
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.h), // Proper vertical centering
                isCollapsed: true, // Ensures proper vertical alignment
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> fields,
    required Color mediumBlue,
    required Color accentBlue,
    required Color highlightBlue,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: mediumBlue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: accentBlue.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: highlightBlue,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(title, style: GlobalTextStyles.subHeading(context)),
              ],
            ),
          ),
          Divider(height: 1, color: accentBlue.withOpacity(0.2)),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: fields,
            ),
          ),
        ],
      ),
    );
  }
}
