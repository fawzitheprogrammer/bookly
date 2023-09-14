import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/manager/cubit/similar_books/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksDetailsMoreBooksListView extends StatelessWidget {
  const BooksDetailsMoreBooksListView({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            width: double.infinity,
            height: 124.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: SizedBox(
                  width: 78.w,
                  height: 124.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                      width: 75.w,
                      height: 115.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Center(
            child: Text(state.failureMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
