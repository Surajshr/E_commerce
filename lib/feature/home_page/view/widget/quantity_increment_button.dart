import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../ui/app_color.dart';
import '../../../../ui/app_text_styles.dart';
import '../../logic/home_view_provider.dart';

class QuantityIncrementButton extends ConsumerWidget {
  const QuantityIncrementButton({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeViewProvider.notifier)
      ..calculateNewTotal(productPrice: price);
    return Container(
      decoration: BoxDecoration(
        color: ColorAssets.container,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              viewModel.decrementQuantity(productPrice: price);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Icon(
                Icons.minimize_rounded,
                color: ColorAssets.onBackground,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 22.w, right: 22.w),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final state = ref.watch(homeViewProvider);
                return Text(
                  state.productQuantity.toString(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: ColorAssets.onBackground,
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              viewModel.increaseQuantity(
                productPrice: price,
              );
            },
            child: Icon(
              Icons.add,
              color: ColorAssets.onBackground,
            ),
          )
        ],
      ),
    );
  }
}
