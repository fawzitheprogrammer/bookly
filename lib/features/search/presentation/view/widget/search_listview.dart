import 'package:bookly/core/utils/app_route.dart';
import 'package:bookly/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/view/widget/best_seller_listview_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchInitial) {
        return const SizedBox();
      }
      if (state is SearchLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SearchSuccess) {
        return ListView.builder(
          itemCount: state.books.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRoute.kBookteailsView,
                extra: state.books[index],
              );
            },
            child: BookListView(
              bookName: state.books[index].volumeInfo.title ?? '',
              bookAuthor: state.books[index].volumeInfo.authors?.first ?? '',
              bookImg: state.books[index].volumeInfo.imageLinks.thumbnail,
              rating: state.books[index].volumeInfo.averageRating?.toInt() ?? 0,
              price: state.books[index].saleInfo.listPrice.amount.toString(),
              ratingCount:
                  state.books[index].volumeInfo.ratingsCount?.toInt() ?? 0,
            ),
          ),
        );
      } else {
        return const Center(
          child: Text('No results'),
        );
      }
    });
  }
}
