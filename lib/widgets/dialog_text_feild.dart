import 'package:flutter/material.dart';

class AppTextFiledHint extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final int? maxLength;
  final double? height;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final bool showCursor;
  final Function? functionSuffixPressed;
  final IconData? suffix;
  final IconData? prefix;
  final Function()? onTap;

  const AppTextFiledHint(
      {Key? key,
      this.textInputType = TextInputType.text,
      this.maxLength = 1,
      this.height = 48,
      this.suffix,
      this.prefix,
      this.hintText = '',
      this.obscureText = false,
      this.readOnly = false,
      this.showCursor = true,
      this.controller,
      this.onTap,
      this.functionSuffixPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!,
      width: 322,
      child: TextFormField(
        controller: controller,
        maxLines: maxLength,
        showCursor: showCursor,
        textDirection: TextDirection.rtl,
        cursorColor: const Color(0xff0F62AC),
        autocorrect: true,
        enableSuggestions: true,
        autofocus: false,
        readOnly: readOnly,
        keyboardType: textInputType,
        obscureText: obscureText,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff8E8E93),
          ),
          counterText: '',
          enabledBorder: borderEnable,
          focusedBorder: borderFocused,

          suffixIcon: suffix != null
              ? GestureDetector(
                  onTap: () {
                    functionSuffixPressed!();
                  },
                  child: Icon(
                    suffix,
                    color: const Color(0xff0F62AC),
                  ),
                )
              : null,
          // prefixIcon: Icon(
          //   prefix,
          //   color: const Color(0xff0F62AC),
          // ),
          fillColor: const Color(0xFFF5F5F5),
          filled: true,
        ),
      ),
    );
  }

  OutlineInputBorder get borderEnable => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: const BorderSide(
          color: Color(0xffDFDEDE),
          width: 1,
        ),
      );

  OutlineInputBorder get borderFocused => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: const BorderSide(
          color: Color(0xff0F62AC),
          width: 1,
        ),
      );
}
