import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_application/core/locator/locator.dart';
import 'package:shopping_application/core/model/product_model/product_model.dart';
import 'package:shopping_application/feature/product_detail/view/product_detail_view.dart';
import 'package:shopping_application/utils/common_utils.dart';

import '../../../core/services/firebase_services.dart';
import '../../../core/services/product_service.dart';
import '../../../ui/app_color.dart';

part 'home_view_provider.freezed.dart';

part 'home_view_model.dart';

part 'home_view_state.dart';

final homeViewProvider =
    StateNotifierProvider<HomeViewModel, HomeViewState>((ref) {
  return HomeViewModel(
    ref: ref,
  )..init();
});
