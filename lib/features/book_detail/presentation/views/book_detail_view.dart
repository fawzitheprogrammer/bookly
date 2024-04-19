import 'package:bookly/features/book_detail/presentation/views/widget/custom_appar.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/more_books_listview.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/price_and_free_preview.dart';
import 'package:bookly/features/book_detail/presentation/views/widget/title_and_author.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/manager/cubit/similar_books/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widget/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/text_styles.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .getSimilarBooks(widget.bookModel.volumeInfo.categories?[0] ?? 'none');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}

class BookViewBody extends StatelessWidget {
  const BookViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

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
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
                width: 162.w,
                height: 243.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            BooksDetailTitleAndAuthor(
              bookModel: bookModel,
            ),
            SizedBox(
              height: 18.h,
            ),
            RatingWidget(
              rating: bookModel.volumeInfo.ratingsCount?.toInt() ?? 0,
              raingCount: bookModel.volumeInfo.averageRating?.toInt() ?? 0,
            ),
            SizedBox(
              height: 28.h,
            ),
            BookDetailPriceAndFreePreView(
              bookModel: bookModel,
            ),
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
            BooksDetailsMoreBooksListView(
              bookModel: bookModel,
            )
          ],
        ),
      ),
    );
  }
}
