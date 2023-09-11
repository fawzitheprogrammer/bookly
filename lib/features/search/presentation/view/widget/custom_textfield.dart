import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search here',
        suffixIcon: Padding(
          padding: EdgeInsets.all(18.0.w),
          child: SvgPicture.asset(
            Assets.kSearchIcon,
          ),
        ),
        // enabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        // ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      cursorColor: Colors.white,
    );
  }
}
