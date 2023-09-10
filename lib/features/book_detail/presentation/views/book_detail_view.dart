import 'package:bookly/features/book_detail/presentation/views/widget/custom_appar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookViewBody()),
    );
  }
}

class BookViewBody extends StatelessWidget {
  const BookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 20.h),
        child: const Column(
          children: [
            BookDetailCustomAppBar(),
          ],
        ),
      ),
    );
  }
}
