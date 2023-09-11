import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailCustomButton extends StatelessWidget {
  const BookDetailCustomButton({
    super.key,
    required this.borderRadius,
    required this.text,
    required this.color,
  });

  final BorderRadius borderRadius;
  final Color color;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.w,
      height: 48.h,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      child: DefaultTextStyle.merge(child: text),
    );
  }
}
