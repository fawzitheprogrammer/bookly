import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BooksDetailTitleAndAuthor extends StatelessWidget {
  const BooksDetailTitleAndAuthor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'The Jungle Book',
          style: GoogleFonts.robotoSlab(
            fontSize: 28.sp,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'Rudyard Kipling',
          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}
