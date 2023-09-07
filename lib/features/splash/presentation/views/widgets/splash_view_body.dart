import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slideAnimationFromTop = Tween<Offset>(
      begin: const Offset(0, -2),
      end: Offset.zero,
    ).animate(controller);
    slideAnimationFromBottom =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(controller);

    super.initState();

    controller.forward();
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
}

class SlidingAnimation extends StatelessWidget {
  const SlidingAnimation({
    super.key,
    required this.slideAnimationFromBottom,
    required this.child,
    required this.controller,
  });

  final Animation<Offset> slideAnimationFromBottom;
  final Widget child;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimationFromBottom,
      builder: (context, _) => SlideTransition(
        position: slideAnimationFromBottom,
        child: AnimatedOpacity(
          opacity: controller.value,
          curve: Curves.decelerate,
          duration: const Duration(seconds: 1),
          child: child,
        ),
      ),
    );
  }
}
