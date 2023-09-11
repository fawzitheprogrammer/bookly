import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';

class BookDetailCustomAppBar extends StatelessWidget {
  const BookDetailCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            Assets.kClose,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.kCart,
          ),
        )
      ],
    );
  }
}
