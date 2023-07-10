import 'package:get_it/get_it.dart';
import 'package:shopping_application/core/services/firebase_services.dart';

import '../services/product_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton(() => ProductService());

  locator.registerSingletonAsync(() async {
    final service = FirebaseService();
    await service.init();
    return service;
  });
  await locator.allReady();
}
