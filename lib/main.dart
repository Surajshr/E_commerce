import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_application/core/services/firebase_services.dart';
import 'package:shopping_application/feature/auth/view/auth_view.dart';
import 'package:shopping_application/ui/app_text_styles.dart';
import 'core/firebase_options/firebase_options.dart';
import 'core/locator/locator.dart';
import 'core/routing/routing.dart';
import 'core/services/start_up_services/start_up_services.dart';
import 'feature/home_page/logic/home_view_provider.dart';
import 'feature/home_page/view/dashboard_view.dart';
import 'utils/common_utils.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    final ref = ProviderContainer();
    final startUpService = ref.read(startUpServiceProvider);
    await startUpService.init();
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) {
    dPrint('Error Wile running app :$error');
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.read(goRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp.router(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            routerDelegate: goRouter.routerDelegate,
            routeInformationParser: goRouter.routeInformationParser,
            routeInformationProvider: goRouter.routeInformationProvider,
            title: 'E-commerce',
          ),
        );
      },
    );
  }
}

class InitialHomeView extends ConsumerStatefulWidget {
  const InitialHomeView({super.key});

  @override
  ConsumerState<InitialHomeView> createState() => _InitialHomeViewState();
}

class _InitialHomeViewState extends ConsumerState<InitialHomeView> {
  final firebaseService = locator<FirebaseService>();
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = ref.read(homeViewProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () async {
          //       final response = await firebaseService.storeProduct(
          //         productId: '126', tableName: '',
          //       );
          //       dPrint("success:$response");
          //     },
          //     child: const Text("store"),
          //   ),
          // ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async {
              await viewModel.getProductDetail();
            },
            child: const Text("Fetch"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardView(),
                ),
              );
            },
            child: Text(
              "Navigate",
              style: AppTextStyles.bodyLarge,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthView(),
                ),
              );
            },
            child: const Text("Auth"),
          ),
        ],
      ),
    );
  }
}
