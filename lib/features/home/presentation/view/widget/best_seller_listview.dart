import 'package:flutter/material.dart';

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
     
      itemBuilder: (context, index) => const BestSellerListViewItem(),
    );
  }
}
