import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyRoot());
}

class BooklyRoot extends StatelessWidget {
  const BooklyRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      child: GetMaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        home: const SplashView(),
      ),
    );
  }
}
