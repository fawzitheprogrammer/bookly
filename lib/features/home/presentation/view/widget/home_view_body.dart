import 'package:bookly/core/text_styles.dart';
import 'package:bookly/features/home/presentation/view/widget/best_seller_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_appbar.dart';
import 'custom_page_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 20.h),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const CustomAppBar(),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomPageView(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    'Best Seller',
                    style: Styles.titleMedium,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
          ),
          const BestSellerListView(),
        ],
      ),
    ));
  }
}
