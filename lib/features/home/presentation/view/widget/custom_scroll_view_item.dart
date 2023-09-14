import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScrollViewContainerItem extends StatelessWidget {
  const CustomScrollViewContainerItem(
      {super.key, required this.isHoveredCard, required this.image});

  final bool isHoveredCard;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedContainer(
        margin: EdgeInsets.only(right: 8.w, top: 8.h),
        width: isHoveredCard ? 170.w : 129.w,
        height: isHoveredCard ? 224.h : 193.h,
        duration: const Duration(milliseconds: 150),
        curve: Curves.decelerate,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            errorWidget: ((context, url, error) {
              return Container();
            }),
          ),
        ),
      ),
    );
  }
}
