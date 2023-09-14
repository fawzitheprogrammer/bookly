import 'package:bookly/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget(
      {super.key, required this.rating, required this.raingCount});

  final int rating;
  final int raingCount;

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
            text: rating.toStringAsFixed(1),
            style: Styles.montserratNormal,
            children: [
              TextSpan(
                text: '($raingCount)',
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
