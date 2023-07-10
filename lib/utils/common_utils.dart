import 'package:flutter/foundation.dart';

void dPrint(String message) {
  if (kDebugMode) {
    print('dPrint: $message');
  }
}