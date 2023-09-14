import 'package:bookly/core/utils/app_route.dart';
import 'package:bookly/features/home/manager/cubit/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'best_seller_listview_item.dart';

class HomeViewBestSellerListView extends StatelessWidget {
  const HomeViewBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BestSellerListView();
  }
}

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRoute.kBookteailsView,
                      extra: state.books[index],
                    );
                  },
                  child: BookListView(
                    bookName: state.books[index].volumeInfo.title ?? '',
                    bookAuthor:
                        state.books[index].volumeInfo.authors?.first ?? '',
                    bookImg: state.books[index].volumeInfo.imageLinks.thumbnail,
                    rating:
                        state.books[index].volumeInfo.averageRating?.toInt() ??
                            0,
                    price:
                        state.books[index].saleInfo.listPrice.amount.toString(),
                    ratingCount:
                        state.books[index].volumeInfo.ratingsCount?.toInt() ??
                            0,
                  ),
                );
              });
        } else if (state is NewestBooksFailure) {
          return Text(state.failureMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
