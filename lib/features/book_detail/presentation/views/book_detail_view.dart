import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/custom_appar.dart';
import 'package:bookly/features/home/presentation/view/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/text_styles.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookViewBody()),
    );
  }
}

class BookViewBody extends StatelessWidget {
  const BookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BookDetailCustomAppBar(),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                Assets.kBooks,
                width: 162.w,
                height: 243.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            const BooksDetailTitleAndAuthor(),
            SizedBox(
              height: 18.h,
            ),
            const RatingWidget(),
            SizedBox(
              height: 28.h,
            ),
            const BookDetailPriceAndFreePreView(),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    "You can also like",
                    style: Styles.titleMedium.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const BooksDetailsMoreBooksListView()
          ],
        ),
      ),
    );
  }
}

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

class BookDetailPriceAndFreePreView extends StatelessWidget {
  const BookDetailPriceAndFreePreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 150.w,
          height: 48.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
            ),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '19.99',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: '€',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 150.w,
          height: 48.h,
          decoration: const ShapeDecoration(
            color: Color(0xFFEF8262),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
          child: Text(
            'Free preview',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class BooksDetailsMoreBooksListView extends StatelessWidget {
  const BooksDetailsMoreBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 124.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Container(
            width: 78.w,
            height: 124.h,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(Assets.kBooks),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19414141),
                  blurRadius: 24,
                  offset: Offset(7, 15),
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.circular(7.r),
            ),
          ),
        ),
      ),
    );
  }
}
