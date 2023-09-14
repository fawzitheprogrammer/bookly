import 'package:bookly/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/view/widget/best_seller_listview_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRoute.kBookteailsView);
        },
        child: const BookListView(
          bookAuthor: '',
          bookImg: '',
          bookName: '',
          rating: 0,
          price: '',
          ratingCount: 0,
        ),
      ),
    );
  }
}
