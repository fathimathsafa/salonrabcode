import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/owner_profile_screen/view/owner_profile_screen.dart';
import '../../../../core/common/painters/background_painter.dart';
import '../controller/partners_adding_controller.dart';

class PartnersAddingScreen extends StatelessWidget {
  PartnersAddingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("RABLOON", style: GlobalTextStyles.appBarHeading(context)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: ColorTheme.highlightBlue, size: 20.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: ColorTheme.darkBlue,
      body: Consumer<PartnersAddingController>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              // Background decoration
              Positioned.fill(
                child: CustomPaint(
                  painter: BackgroundPainter(),
                ),
              ),

              // Scrollable content
              SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title with animated underline
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add Your Partners",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 100.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorTheme.accentBlue,
                                    ColorTheme.highlightBlue
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 35.h),

                        // Form
                        Form(
                          key: provider.formKey,
                          child: Column(
                            children: [
                              _buildInputCard(
                                icon: Icons.person_outline,
                                title: "Partner Name",
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: provider.partnerNameController,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                  decoration: InputDecoration(
                                    hintText: "Enter partner name",
                                    hintStyle: TextStyle(
                                        color: Colors.white60, fontSize: 14.sp),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter partner name';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(height: 20.h),

                              _buildInputCard(
                                icon: Icons.email_outlined,
                                title: "Email",
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: provider.emailController,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                  decoration: InputDecoration(
                                    hintText: "Enter email address",
                                    hintStyle: TextStyle(
                                        color: Colors.white60, fontSize: 14.sp),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email address';
                                    }
                                    if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(height: 20.h),

                              _buildInputCard(
                                icon: Icons.alternate_email,
                                title: "Username",
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: provider.usernameController,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                  decoration: InputDecoration(
                                    hintText: "Enter username",
                                    hintStyle: TextStyle(
                                        color: Colors.white60, fontSize: 14.sp),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter username';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(height: 20.h),

                              _buildInputCard(
                                icon: Icons.lock_outline,
                                title: "Password",
                                child: TextFormField(
                                  controller: provider.passwordController,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                  obscureText: !provider.isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: "Enter password",
                                    hintStyle: TextStyle(
                                        color: Colors.white60, fontSize: 14.sp),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        provider.isPasswordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white60,
                                        size: 20.sp,
                                      ),
                                      onPressed: () {
                                        provider.togglePasswordVisibility();
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                  height:
                                      90.h), // Extra space for bottom buttons
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<PartnersAddingController>(
        builder: (context, provider, child) {
          return Container(
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
                      onPressed: () => provider.saveAndAddNew(context),
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: ColorTheme.highlightBlue,
                        size: 20.sp,
                      ),
                      label: Text(
                        "SAVE & NEW",
                        style: TextStyle(
                          color: ColorTheme.highlightBlue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 12.sp,
                        ),
                      ),
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
                      onPressed: () => provider.savePartner(context),
                      icon: Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      label: Text(
                        "SAVE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 12.sp,
                        ),
                      ),
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
          );
        },
      ),
    );
  }

  Widget _buildInputCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.mediumBlue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon,
                      color: ColorTheme.highlightBlue.withOpacity(0.7),
                      size: 18.sp),
                  SizedBox(width: 6.w),
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
