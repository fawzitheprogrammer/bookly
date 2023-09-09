import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) => const BestSellerListViewItem(),
    );
  }
}


