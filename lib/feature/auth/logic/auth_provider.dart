import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_application/core/formz/email_formz.dart';
import 'package:shopping_application/core/formz/password_formz.dart';
import 'package:shopping_application/feature/home_page/view/dashboard_view.dart';
import 'package:shopping_application/utils/common_utils.dart';

import '../../../core/locator/locator.dart';
import '../../../core/routing/routing.dart';
import '../../../core/services/firebase_services.dart';
import '../../../ui/app_color.dart';
part 'auth_provider.freezed.dart';

part 'auth_view_model.dart';

part 'auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AppAuthState>((ref) {
      final goRouter = ref.watch(goRouterProvider);
  return AuthViewModel(
    goRouter: goRouter,
      // pushNotificationService: pushNotificationService,
      );
});
