import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_application/core/locator/locator.dart';

final startUpServiceProvider = Provider<StartUpService>((ref) {
  return StartUpService();
});

class StartUpService {
  StartUpService();

  Future<void> init() async {
    await setUpLocator();
  }
}
