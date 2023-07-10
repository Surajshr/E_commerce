import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_application/core/splash/splash_view_model.dart';

import '../../utils/common_utils.dart';
import '../locator/locator.dart';
import '../routing/routing.dart';
import '../services/firebase_services.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashView> {
  final firebaseService = locator<FirebaseService>();
  late SplashViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ref.read(splashViewModelProvider.notifier);
    firebaseService.firebaseAuth.authStateChanges().listen((User? user) {
      dPrint('userDetail:$user');
      if (user == null) {
        dPrint('User is currently signed out!');
        viewModel.goRouter.pushNamed(AppRoute.authView.name);
      } else {
        dPrint('User is signed in!');
        viewModel.goRouter.pushNamed(AppRoute.dashboard.name);
      }
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(splashViewModelProvider.notifier).checkInitialState();
    // });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          alignment: Alignment.center,
          child: Center(
            child: Image.asset(
              'images/smartphone.png',
              height: 60.h,
              width: 60.w,
            ),
          ),
        ),
      );
}
