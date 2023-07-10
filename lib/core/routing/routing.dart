import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_application/feature/auth/view/auth_view.dart';
import 'package:shopping_application/feature/home_page/view/dashboard_view.dart';

import '../../common/widgets/error_view.dart';
import '../../feature/home_page/view/home_view.dart';
import '../splash/splash_view.dart';

enum AppRoute {
  authView,
  homeView,
  productDetail,
  splash,
  dashboard,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    redirectLimit: 10,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/authView',
        name: AppRoute.authView.name,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: '/homeView',
        name: AppRoute.homeView.name,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/dashboard',
        name: AppRoute.dashboard.name,
        builder: (context, state) => const DashboardView(),
      ),
    ],
    errorBuilder: (context, state) => ErrorView(error: state.error),
  );
});
