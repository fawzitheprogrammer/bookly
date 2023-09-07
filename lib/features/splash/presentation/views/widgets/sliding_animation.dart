import 'package:flutter/cupertino.dart';

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
