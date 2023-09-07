import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.logo,
            width: 200.w,
          ),
          SizedBox(
            height: 16.h,
          ),
          const Text(
            'Read Free Books',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
