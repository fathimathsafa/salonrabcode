import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/presentation/owner_side/owner_profile_screen/controller/owner_profile_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/partners_adding_screen/view/partners_adding_screen.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Background decoration
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(
                darkBlue: const Color(0xFF0A1128),
                mediumBlue: const Color(0xFF1C2E4A),
                lightBlue: const Color(0xFF31639C),
                accentBlue: const Color(0xFF4D9DE0),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                      child: Consumer<OwnerProfileScreenController>(
                        builder: (context, controller, child) {
                          return Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header
                                buildHeaderSection(),
                                SizedBox(height: 40.h),

                                // Form Fields
                                Column(
                                  children: [
                                    buildInputField(
                                      controller: controller.nameController,
                                      label: "Owner Name",
                                      icon: Icons.person,
                                      index: 0,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(0),
                                      context: context,
                                    ),
                                    buildInputField(
                                      controller: controller.phoneController,
                                      label: "Phone Number",
                                      icon: Icons.phone,
                                      index: 1,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(1),
                                      context: context,
                                    ),
                                    buildInputField(
                                      controller: controller.emailController,
                                      label: "Email",
                                      icon: Icons.email,
                                      index: 2,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(2),
                                      context: context,
                                    ),
                                    buildInputField(
                                      controller: controller.aadharController,
                                      label: "Aadhar Number",
                                      icon: Icons.badge,
                                      index: 3,
                                      currentField: controller.currentField,
                                      onTap: () => controller.setCurrentField(3),
                                      context: context,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Button Section
                Column(
                  children: [
                    // First Button - Add Salon Partners
                    Container(
                      width: double.infinity,
                      height: 45.h,
                      margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4D9DE0),
                            Color(0xFF7EDFFF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4D9DE0).withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PartnersAddingScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ADD SALON PARTNERS",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(Icons.group_add, size: 20.sp),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),

                    // Second Button - Make Me As An Employee
                    Container(
                      width: double.infinity,
                      height: 45.h,
                      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF31639C),
                            Color(0xFF4D9DE0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF31639C).withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          print("Button Pressed!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "MAKE ME AS AN EMPLOYEE",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(Icons.badge, size: 20.sp),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFF4D9DE0).withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                Icons.person,
                color: const Color(0xFF7EDFFF),
                size: 30.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FATHIMA",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: const Color(0xFF7EDFFF),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Nasrin",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.95),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumeric = false,
    required int index,
    required int currentField,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    bool isActive = currentField == index;

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16.sp,
                  color: isActive ? const Color(0xFF7EDFFF) : Colors.white70,
                ),
                SizedBox(width: 8.w),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isActive ? const Color(0xFF7EDFFF) : Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF1C2E4A).withOpacity(0.8) : const Color(0xFF1C2E4A).withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isActive ? const Color(0xFF7EDFFF) : const Color(0xFF4D9DE0).withOpacity(0.3),
                width: isActive ? 2 : 1,
              ),
              boxShadow: isActive ? [
                BoxShadow(
                  color: const Color(0xFF7EDFFF).withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                )
              ] : null,
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
              onTap: onTap,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                suffixIcon: isActive ? IconButton(
                  icon: Icon(Icons.save, size: 18.sp),
                  color: const Color(0xFF7EDFFF),
                  onPressed: () {
                    Provider.of<OwnerProfileScreenController>(context, listen: false).saveField(context, index);
                  },
                ) : null,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final Color darkBlue;
  final Color mediumBlue;
  final Color lightBlue;
  final Color accentBlue;

  BackgroundPainter({
    required this.darkBlue,
    required this.mediumBlue,
    required this.lightBlue,
    required this.accentBlue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the background
    Paint backgroundPaint = Paint()..color = darkBlue;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the top right decoration
    Paint gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          accentBlue.withOpacity(0.3),
          accentBlue.withOpacity(0.1),
          darkBlue.withOpacity(0),
        ],
        stops: const [0.2, 0.6, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.9, size.height * 0.1),
        radius: size.width * 0.6,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.1),
      size.width * 0.6,
      gradientPaint,
    );

    // Draw the bottom left decoration
    Paint bottomGradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          lightBlue.withOpacity(0.15),
          mediumBlue.withOpacity(0.05),
          darkBlue.withOpacity(0),
        ],
        stops: const [0.2, 0.6, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.1, size.height * 0.85),
        radius: size.width * 0.5,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.85),
      size.width * 0.5,
      bottomGradientPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}