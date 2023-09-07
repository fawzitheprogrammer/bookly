import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyRoot());
}

class BooklyRoot extends StatelessWidget {
  const BooklyRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashView(),
    );
  }
}
