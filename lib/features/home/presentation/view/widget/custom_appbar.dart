import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.logo,
          width: 75.w,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.kSearchIcon,
          ),
        )
      ],
    );
  }
}
