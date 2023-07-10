import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../utils/common_utils.dart';
import '../locator/locator.dart';
import '../routing/routing.dart';
import '../services/firebase_services.dart';

class SplashViewModel extends StateNotifier<bool> {
  final GoRouter goRouter;

  SplashViewModel({
    required this.goRouter,
  }) : super(false);
  final firebaseService = locator<FirebaseService>();

  Future<void> checkInitialState() async {
    try {
      final authState = await firebaseService.checkAuthStateChange();
      dPrint('authStateRespond:$authState');
      if (authState == 'loggedOut') {
        dPrint('userNotLoggedIn ');
        goRouter.goNamed(AppRoute.authView.name);
      } else {
        dPrint('userLogged in');
        goRouter.goNamed(AppRoute.dashboard.name);
      }
    } catch (e) {
      dPrint('GetExceptionWhileNavigationFromSplashScreen $e');
      goRouter.goNamed(AppRoute.dashboard.name);
    } finally {
      Future.delayed(
        const Duration(milliseconds: 500),
      );
      FlutterNativeSplash.remove();
    }
  }
}

final splashViewModelProvider =
    StateNotifierProvider<SplashViewModel, bool>((ref) {
  final goRouter = ref.watch(goRouterProvider);
  return SplashViewModel(goRouter: goRouter);
});
