import 'package:bookly/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.amber,
          size: 18.r,
        ),
        RichText(
          text: TextSpan(
            text: '4.8',
            style: Styles.montserratNormal,
            children: [
              TextSpan(
                text: '(2390)',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
