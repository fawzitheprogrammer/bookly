import 'package:bookly/features/book_detail/presentation/views/widget/custom_button.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailPriceAndFreePreView extends StatelessWidget {
  const BookDetailPriceAndFreePreView({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: BookDetailCustomButton(
            text: Text(
              '${bookModel.saleInfo.listPrice.amount.toString()} \$',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 14.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            ),
          ),
        ),
        Expanded(
          child: BookDetailCustomButton(
            text: Text(
              'Free preview',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            color: const Color(0xFFEF8262),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
          ),
        ),
      ],
    );
  }
}
