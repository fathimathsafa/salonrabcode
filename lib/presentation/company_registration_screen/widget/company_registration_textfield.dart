import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for input formatters
import '../../../../core/constants/colors.dart';

class CompanyRegistrationTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;

  const CompanyRegistrationTextField({
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .01),
      child: TextField(
        style: TextStyle(color: Colors.white),
        keyboardType: keyboardType, // Set the keyboard type
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly] // Restrict to digits only
            : [], // No restriction for other fields
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorTheme.highlightBlue, width: 2.0),
          ),
        ),
      ),
    );
  }
}