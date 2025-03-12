import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/common/widget/serach_bar.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/controller/employees_adding_controller.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/widget/service_container.dart';

class EmployeesAddingScreen extends StatelessWidget {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A2151),
                  Color(0xFF0D1137),
                ],
              ),
            ),
          ),
          Positioned(
            top: 24.h,
            left: 24.w,
            right: 24.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: ColorTheme.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text("RABLOON",
                    style: GlobalTextStyles.appBarHeadding(context)),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 100.h, left: 24.w, right: 24.w, bottom: 24.h),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Your Salon Team",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Add employees and assign their work ",
                        style: TextStyle(
                          color: ColorTheme.secondarycolor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 250.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.teal, Colors.purple],
                          ),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(height: 35.h),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: ColorTheme.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8.r,
                              spreadRadius: 2.r,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // First Row with Text
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Label Text",
                                  style: GoogleFonts.urbanist(
                                      fontSize: 15.sp,
                                      color: ColorTheme.white)),
                            ),
                            SizedBox(height: 12.h),

                            Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 12.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Colors.teal, // Background color
                                borderRadius: BorderRadius.circular(
                                    12.r), // Rounded edges
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.urbanist(
                                      color: Color(0xFF0D1137)),
                                  hintText: "Full Name",
                                  border: InputBorder.none, // Removes outline
                                  prefixIcon: Icon(
                                    Icons.person_2_outlined,
                                    size: 20.sp,
                                    color: Color(0xFF0D1137),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),

                            // Third Column - Row with Two TextFormFields
                            Row(
                              children: [
                                // First TextFormField
                                Expanded(
                                  child: Container(
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 12.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: Colors.teal, // Background color
                                      borderRadius: BorderRadius.circular(
                                          12.r), // Rounded edges
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.urbanist(
                                            color: Color(0xFF0D1137)),
                                        hintText: "Username",
                                        border:
                                            InputBorder.none, // Removes outline
                                        prefixIcon: Icon(
                                          Icons.account_circle_outlined,
                                          size: 20.sp,
                                          color: Color(0xFF0D1137),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),

                                // Second TextFormField
                                Expanded(
                                  child: Container(
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 12.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: Colors.teal, // Background color
                                      borderRadius: BorderRadius.circular(
                                          12.r), // Rounded edges
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.urbanist(
                                            color: Color(0xFF0D1137)),
                                        hintText: "Password",
                                        border:
                                            InputBorder.none, // Removes outline
                                        prefixIcon: Icon(
                                          Icons.lock_outline_rounded,
                                          size: 20.sp,
                                          color: Color(0xFF0D1137),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 35.h),
                      Text("Service List",
                          style: GlobalTextStyles.subHeadding(context)),
                      SizedBox(height: 35.h),

                      SearchBarSalon(
                        hintText: 'Search Service',
                      ),
                      SizedBox(
                        height: 300.h, // Set a height for GridView
                        child: GridView.builder(
                          itemCount: serviceCategories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: aspectRatio,
                          ),
                          itemBuilder: (context, index) {
                            return ServiceContainer(
                              name: serviceCategories[index]['category'],
                              isMobile: isMobile,
                              isTablet: isTablet,
                              isLaptop: isLaptop,
                              services: List<Map<String, String>>.from(
                                  serviceCategories[index]['services']),
                              onSelectService: (service) {
                                Provider.of<SelectedServiceProvider>(context,
                                        listen: false)
                                    .selectService(service);
                              },
                            );
                          },
                        ),
                      ),
                      // Bottom buttons
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            bottom: 24.h,
            child: Row(
              children: [
                Expanded(
                  child: _buildGradientButton(
                    "SAVE & NEW",
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.blue],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _buildGradientButton(
                    "SAVE",
                    gradient: LinearGradient(
                      colors: [Colors.teal, Colors.tealAccent],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildGradientButton(
  String text, {
  required Gradient gradient,
  required VoidCallback onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:salonrabcode/core/constants/colors.dart';
// import 'package:salonrabcode/core/constants/text_styles.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/controller/employees_adding_controller.dart';
// import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/widget/service_container.dart';
// import 'package:salonrabcode/presentation/owner_side/service_adding_screen/widgets/common_textformfield.dart';
// import 'package:salonrabcode/core/common/widget/serach_bar.dart';

// class EmployeesAddingScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> serviceCategories = [
//     {
//       "category": "Haircut",
//       "services": [
//         {"name": "Men's Haircut", "gender": "Male", "price": "20"},
//         {"name": "Women's Haircut", "gender": "Female", "price": "30"},
//         {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
//         {"name": "Men's Haircut", "gender": "Male", "price": "20"},
//         {"name": "Women's Haircut", "gender": "Female", "price": "30"},
//         {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
//         {"name": "Men's Haircut", "gender": "Male", "price": "20"},
//         {"name": "Women's Haircut", "gender": "Female", "price": "30"},
//         {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
//         {"name": "Men's Haircut", "gender": "Male", "price": "20"},
//         {"name": "Women's Haircut", "gender": "Female", "price": "30"},
//         {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
//         {"name": "Men's Haircut", "gender": "Male", "price": "20"},
//         {"name": "Women's Haircut", "gender": "Female", "price": "30"},
//         {"name": "Kids' Haircut", "gender": "Unisex", "price": "15"},
//       ]
//     },
//     {
//       "category": "Shaving",
//       "services": [
//         {"name": "Beard Trim", "gender": "Male", "price": "10"},
//         {"name": "Clean Shave", "gender": "Male", "price": "15"},
//       ]
//     },
//     {
//       "category": "Hair Spa",
//       "services": [
//         {"name": "Keratin Treatment", "gender": "Unisex", "price": "50"},
//         {"name": "Deep Conditioning", "gender": "Unisex", "price": "40"},
//       ]
//     },
//     {
//       "category": "Facial",
//       "services": [
//         {"name": "Basic Facial", "gender": "Unisex", "price": "25"},
//         {"name": "Anti-Aging Facial", "gender": "Unisex", "price": "40"},
//       ]
//     },
//     {
//       "category": "Manicure",
//       "services": [
//         {"name": "Classic Manicure", "gender": "Unisex", "price": "20"},
//         {"name": "Gel Manicure", "gender": "Unisex", "price": "30"},
//       ]
//     },
//     {
//       "category": "Pedicure",
//       "services": [
//         {"name": "Regular Pedicure", "gender": "Unisex", "price": "25"},
//         {"name": "Spa Pedicure", "gender": "Unisex", "price": "35"},
//       ]
//     },
//     {
//       "category": "Massage",
//       "services": [
//         {"name": "Full Body Massage", "gender": "Unisex", "price": "50"},
//         {"name": "Head Massage", "gender": "Unisex", "price": "20"},
//       ]
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isMobile = screenWidth <= 600;
//     bool isTablet = screenWidth > 600 && screenWidth <= 1024;
//     bool isLaptop = screenWidth > 1024;

//     int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
//     double aspectRatio = isMobile ? 2 : (isTablet ? 1.8 : 1.6);
//     double padding = isMobile ? 10.w : (isTablet ? 20.w : 30.w);
//     final selectedServices =
//         Provider.of<SelectedServiceProvider>(context).selectedServices;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color(0xFF1A2151),
//                   Color(0xFF0D1137),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 24.h,
//             left: 24.w,
//             right: 24.w,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 Text("RABLOON",
//                     style: GlobalTextStyles.appBarHeadding(context)),
//               ],
//             ),
//           ),
//           SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Padding(
//               padding: EdgeInsets.only(
//                   top: 100.h, left: 24.w, right: 24.w, bottom: 24.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Add Your Salon Teams",
//                       style: GlobalTextStyles.subHeadding(context)),
//                   SizedBox(height: isMobile ? 8.h : 20.h),
//                   Text("Add your employees and assign their services",
//                       style: GlobalTextStyles.hintStyle(context)),
//                   SizedBox(height: isMobile ? 8.h : 20.h),

//                   Container(
//                     width: 100.w,
//                     height: 4.h,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.teal, Colors.purple],
//                       ),
//                       borderRadius: BorderRadius.circular(2.r),
//                     ),
//                   ),
//                   SizedBox(height: 35.h),

//                   // Employee Form
//                   Container(
//                     padding: EdgeInsets.all(10.w),
//                     decoration: BoxDecoration(
//                       color: ColorTheme.maincolor,
//                       borderRadius: BorderRadius.circular(12.r),
//                       border: Border.all(color: ColorTheme.maincolor, width: 1),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         buildTextFieldLabel("Employee Details", context),
//                         CommonTextFormField(hintText: 'Enter employee name'),
//                         Row(
//                           children: [
//                             CommonTextFormField(hintText: 'Enter user name'),
//                             CommonTextFormField(hintText: 'Enter password'),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   // Display selected service

//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Show "Selected Services" only if services exist
//                       if (selectedServices.isNotEmpty)
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 10.h),
//                           child: Text(
//                             "Selected Services",
//                             style: GlobalTextStyles.subHeadding(context),
//                           ),
//                         ),

//                       // Display selected services list only if there are selected services
//                       if (selectedServices.isNotEmpty)
//                         Container(
//                           height: 120.h, // Adjust height as needed
//                           child: ListView.builder(
//                             scrollDirection: Axis
//                                 .horizontal, // ✅ Makes the list scroll horizontally
//                             itemCount: selectedServices.length,
//                             itemBuilder: (context, index) {
//                               final service = selectedServices[index];
//                               return Expanded(
//                                 child: Container(
//                                   width: 200
//                                       .w, // ✅ Set a fixed width for each item
//                                   margin: EdgeInsets.only(
//                                       right:
//                                           10.w), // ✅ Add spacing between items
//                                   padding: EdgeInsets.all(10.w),
//                                   decoration: BoxDecoration(
//                                     color: ColorTheme.maincolor,
//                                     borderRadius: BorderRadius.circular(12.r),
//                                     border: Border.all(
//                                         color: ColorTheme.maincolor, width: 1),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: Text("${service['name']}",
//                                             style: GlobalTextStyles.hintStyle(
//                                                 context)),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                             "Gender: ${service['gender']}",
//                                             style: GlobalTextStyles.hintStyle(
//                                                 context)),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                             "Price: \$${service['price']}",
//                                             style: GlobalTextStyles.hintStyle(
//                                                 context)),
//                                       ),
//                                       Align(
//                                         alignment: Alignment.centerRight,
//                                         child: IconButton(
//                                           onPressed: () {},
//                                           icon: Icon(Icons.delete,
//                                               color: ColorTheme.red),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         )
//                     ],
//                   ),

//                   SizedBox(height: isMobile ? 10.h : 20.h),
//                   Text("Service List",
//                       style: GlobalTextStyles.subHeadding(context)),
//                   SizedBox(height: isMobile ? 10.h : 20.h),
//                   SearchBarSalon(hintText: 'Search Service'),
//                   SizedBox(height: isMobile ? 10.h : 20.h),

//                   // Service Grid
//                   SizedBox(
//                     height: 300.h, // Set a height for GridView
//                     child: GridView.builder(
//                       itemCount: serviceCategories.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: crossAxisCount,
//                         crossAxisSpacing: 10.w,
//                         mainAxisSpacing: 10.h,
//                         childAspectRatio: aspectRatio,
//                       ),
//                       itemBuilder: (context, index) {
//                         return ServiceContainer(
//                           name: serviceCategories[index]['category'],
//                           isMobile: isMobile,
//                           isTablet: isTablet,
//                           isLaptop: isLaptop,
//                           services: List<Map<String, String>>.from(
//                               serviceCategories[index]['services']),
//                           onSelectService: (service) {
//                             Provider.of<SelectedServiceProvider>(context,
//                                     listen: false)
//                                 .selectService(service);
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: ColorTheme.white,
//         padding: EdgeInsets.symmetric(
//           horizontal: 20.w, // Responsive horizontal padding
//           vertical: 15.h, // Responsive vertical padding
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: ColorTheme.maincolor,
//                       width: 1.w, // Responsive border width
//                     ),
//                     color: ColorTheme.white,
//                     borderRadius:
//                         BorderRadius.circular(10.r), // Responsive radius
//                   ),
//                   height: 50.h, // Responsive height
//                   child: Center(
//                     child: Text(
//                       'SAVE AND NEW',
//                       style: GlobalTextStyles.saveAndNewButtonText(context),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 15.w), // Responsive spacing between buttons
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: ColorTheme.maincolor,
//                     borderRadius:
//                         BorderRadius.circular(10.r), // Responsive radius
//                   ),
//                   height: 50.h, // Responsive height
//                   child: Center(
//                     child: Text(
//                       'SAVE SERVICE',
//                       style: GlobalTextStyles.saveButtonText(context),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTextFieldLabel(String text, BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
//       child: Text(text, style: GlobalTextStyles.textFormfieldHead(context)),
//     );
//   }
// }
