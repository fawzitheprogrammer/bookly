import 'package:bookly/core/utils/app_route.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimationFromTop;
  late Animation<Offset> slideAnimationFromBottom;
  late Animation<Opacity> opacityAnimation;

  @override
  void initState() {
    initSlidingAnimation();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlidingAnimation(
            slideAnimationFromBottom: slideAnimationFromTop,
            controller: controller,
            child: Image.asset(
              Assets.logo,
              width: 200.w,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SlidingAnimation(
              slideAnimationFromBottom: slideAnimationFromBottom,
              controller: controller,
              child: const Text(
                'Read Free Books',
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slideAnimationFromTop = Tween<Offset>(
      begin: const Offset(0, -2),
      end: Offset.zero,
    ).animate(controller);
    slideAnimationFromBottom =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(controller);

    controller.forward().whenComplete(() {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        GoRouter.of(context).push(AppRoute.kHomeView);
      });
    });
  }
}
