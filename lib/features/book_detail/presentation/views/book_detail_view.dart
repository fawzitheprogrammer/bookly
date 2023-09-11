import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/custom_appar.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/more_books_listview.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/price_and_free_preview.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/title_and_author.dart';
import 'package:bookly/features/home/presentation/view/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
