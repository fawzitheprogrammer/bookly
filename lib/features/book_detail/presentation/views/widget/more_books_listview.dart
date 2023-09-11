import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';

class BooksDetailsMoreBooksListView extends StatelessWidget {
  const BooksDetailsMoreBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 124.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Container(
            width: 78.w,
            height: 124.h,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(Assets.kBooks),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19414141),
                  blurRadius: 24,
                  offset: Offset(7, 15),
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.circular(7.r),
            ),
          ),
        ),
      ),
    );
  }
}
