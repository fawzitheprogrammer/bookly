import 'package:bookly/features/search/presentation/view/widget/search_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/text_styles.dart';
import 'custom_textfield.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchTextField(),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  'Search Results',
                  style: Styles.titleMedium.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              const Expanded(child: SearchResultListView())
            ],
          ),
        ),
      ),
    );
  }
}
