import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/manager/cubit/featured_books_cubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_scroll_view_item.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int currentIndex = 0;

  final _controller = PageController(initialPage: 0, viewportFraction: 0.47);

  List<BookModel> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
        builder: (context, state) {
      if (state is FeaturedBookSuccess) {
        books = state.featuredBooks;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.h),
          child: SizedBox(
            //width: 160.w,
            height: 224.h,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: state.featuredBooks.length,
              padEnds: false,
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
              itemBuilder: (context, index) {
                return CustomScrollViewContainerItem(
                  image: books[index].volumeInfo.imageLinks.thumbnail,
                  isHoveredCard: currentIndex == index,
                );
              },
            ),
          ),
        );
      } else if (state is FeaturedBookFailure) {
        return const Text('Something went wrong');
      } else if (state is FeaturedBookLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
