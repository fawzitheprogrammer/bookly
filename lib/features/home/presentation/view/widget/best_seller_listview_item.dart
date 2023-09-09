import 'package:bookly/features/home/presentation/view/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: Image.asset(
              Assets.kBooks,
              width: 75.w,
              height: 115.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: SizedBox(
              height: 115.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'Harry Potter and the Goblet of Fire',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Text(
                    'J.K Rowling',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'19.99$',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const RatingWidget(),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
