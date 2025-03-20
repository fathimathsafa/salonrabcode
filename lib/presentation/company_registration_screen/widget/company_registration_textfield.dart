import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CompanyRegistrationTextField extends StatelessWidget {
  final String label;

  const CompanyRegistrationTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .01),
      child: TextField(
        style: TextStyle(color: Colors.white), // Updated text color
        decoration: InputDecoration(
          labelText: label,
          // labelStyle: GLTextStyles.textformfieldtext().copyWith(color: Colors.white70), // Updated label color
          // Set default (enabled) border color
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue), // Updated border color
          ),
          // Set focused border color
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue, width: 2.0), // Updated border color
          ),
          // Set error border color
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue), // Updated border color
          ),
          // Set focused error border color
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue, width: 2.0), // Updated border color
          ),
        ),
      ),
    );
  }
}