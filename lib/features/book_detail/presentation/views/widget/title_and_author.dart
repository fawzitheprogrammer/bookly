import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BooksDetailTitleAndAuthor extends StatelessWidget {
  const BooksDetailTitleAndAuthor({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          bookModel.volumeInfo.title!,
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
          bookModel.volumeInfo.authors![0],
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
