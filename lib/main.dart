import 'package:bookly/constants.dart';
import 'package:bookly/core/service_locator.dart';
import 'package:bookly/core/utils/app_route.dart';
import 'package:bookly/features/home/data/repo/home_repo_implement.dart';
import 'package:bookly/features/home/manager/cubit/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly/features/home/manager/cubit/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/manager/cubit/similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyRoot());
}

class BooklyRoot extends StatelessWidget {
  const BooklyRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(
            getIt.get<HomeRepoImplement>(),
          )..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplement>(),
          )..getNewestBook(),
        ),
        BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImplement>(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          ),
          routerConfig: AppRoute.router,
        ),
      ),
    );
  }
}
