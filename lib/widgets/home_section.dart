import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'المزيد',
            style: GoogleFonts.nunito(),
          ),
        )
      ],
    );
  }
}
