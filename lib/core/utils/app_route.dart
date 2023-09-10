import 'package:bookly/features/book_detail/presentation/views/book_detail_view.dart';
import 'package:bookly/features/home/presentation/view/home.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  //static const kSplashView = '/splashView';
  static const kHomeView = '/homeView';
  static const kBookteailsView = '/kBookteails';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookteailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
