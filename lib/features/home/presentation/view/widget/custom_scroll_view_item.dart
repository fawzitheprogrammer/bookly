import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';

class CustomScrollViewContainerItem extends StatelessWidget {
  const CustomScrollViewContainerItem({super.key, required this.isHoveredCard});

  final bool isHoveredCard;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedContainer(
        margin: EdgeInsets.only(right: 8.w, top: 8.h),
        width: isHoveredCard ? 170.w : 129.w,
        height: isHoveredCard ? 224.h : 193.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          image: const DecorationImage(
            image: AssetImage(
              Assets.kBooks,
            ),
            fit: BoxFit.fill,
          ),
        ),
        duration: const Duration(milliseconds: 150),
        curve: Curves.decelerate,
      ),
    );
  }
}
