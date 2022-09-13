import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/utils/colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    this.suffix,
    this.max,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onPress,
  }) : super(key: key);
  final Widget? suffix;
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool obscureText;
  final int? max;
  void Function(String)? onPress;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onPress,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: max,
      style: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF4B4B4B),
      ),
      cursorColor: primaryColor,
      minLines: 1,
      maxLines: 1,
      expands: false,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          constraints: const BoxConstraints(
            minHeight: 60,
            maxHeight: 60,
          ),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color(0xFFCCCCCC)),
          suffixIcon: suffix,
          fillColor: textFieldBackground,
          filled: true,
          prefixIcon: prefixIcon,

          // Icon(
          //   prefixIcon,
          //   size: 20,
          //   color: const Color(0xFF4B4B4B),
          // ),
          enabledBorder: border(),
          focusedBorder: border(borderColor: primaryColor)),
    );
  }

  OutlineInputBorder border({Color borderColor = const Color(0xFFDFDEDE)}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
