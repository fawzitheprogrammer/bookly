import 'package:bookly/core/utils/app_route.dart';
import 'package:flutter/material.dart';
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
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRoute.kBookteailsView);
        },
        child: const BestSellerListViewItem(),
      ),
    );
  }
}
