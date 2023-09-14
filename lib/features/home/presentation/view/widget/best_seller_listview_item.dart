import 'package:bookly/features/home/presentation/view/widget/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookListView extends StatelessWidget {
  const BookListView(
      {super.key,
      required this.bookName,
      required this.bookImg,
      required this.bookAuthor,
      required this.rating,
      required this.price,
      required this.ratingCount});

  final String bookName;
  final String bookImg;
  final String bookAuthor;
  final int rating;
  final String price;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: CachedNetworkImage(
              imageUrl: bookImg,
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
                      bookName,
                      style: GoogleFonts.robotoSlab(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Text(
                    bookAuthor,
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
                        price,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingWidget(
                        rating: rating,
                        raingCount: ratingCount,
                      ),
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
