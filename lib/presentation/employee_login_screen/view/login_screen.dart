import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/presentation/company_registration_screen/view/company_registration_screen.dart';
import '../../../core/common/painters/background_painter.dart';
import '../../../core/constants/text_styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.darkBlue,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "RABLOON",
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: ColorTheme.highlightBlue,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background decoration
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo or Icon
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.ac_unit,
                        color: ColorTheme.highlightBlue,
                        size: 60.sp,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // Heading
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Subheading
                    Text(
                      "Sign in to continue to your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white70,
                        letterSpacing: 0.5,
                      ),
                    ),

                    SizedBox(height: 50.h),

                    // Username field
                    buildInputField(
                      label: "Username",
                      icon: Icons.person,
                      isActive: true,
                    ),

                    SizedBox(height: 20.h),

                    // Password field
                    buildInputField(
                      label: "Password",
                      icon: Icons.lock,
                      isActive: false,
                      isPassword: true,
                    ),

                    SizedBox(height: 16.h),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Login button
                    Container(
                      width: double.infinity,
                      height: 55.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorTheme.highlightBlue,
                            ColorTheme.accentBlue,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: ColorTheme.darkBlue.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    // Register text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => CompanyRegistrationScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Register as Owner",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required IconData icon,
    required bool isActive,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isActive
              ? Colors.white.withOpacity(0.5)
              : Colors.white.withOpacity(0.2),
          width: isActive ? 2 : 1,
        ),
        boxShadow: isActive
            ? [
          BoxShadow(
            color: Colors.white.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          )
        ]
            : null,
      ),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          prefixIcon: Icon(
            icon,
            color: isActive ? Colors.white : Colors.white70,
            size: 22.sp,
          ),
          suffixIcon: isPassword
              ? Icon(
            Icons.visibility_off,
            color: Colors.white70,
            size: 22.sp,
          )
              : null,
          hintText: label,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.white38,
          ),
        ),
      ),
    );
  }
}