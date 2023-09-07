import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_scroll_view_item.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int currentIndex = 0;

  final _controller = PageController(initialPage: 0, viewportFraction: 0.47);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.h),
      child: SizedBox(
        //width: 160.w,
        height: 224.h,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padEnds: false,
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return CustomScrollViewContainerItem(
              isHoveredCard: currentIndex == index,
            );
          },
        ),
      ),
    );
  }
}
