import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_application/common/widgets/app_button.dart';

import '../../ui/app_text_styles.dart';
import '../../ui/src/gap.dart';

class CheckOutDialog extends StatelessWidget {
  final String title;
  final String grandTotal;
  final Widget? titleWidget;
  final Widget? descriptionWidget;
  final Function() onClick;

  const CheckOutDialog({
    super.key,
    required this.title,
    required this.grandTotal,
    required this.onClick,
    this.titleWidget,
    this.descriptionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            gapH16,
            // Image.asset(
            //   Assets.success,
            //   width: 40.r,
            //   height: 40.r,
            // ),
            gapH16,
            titleWidget ??
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headlineSmall,
                ),
            gapH8,
            descriptionWidget ??
                Text(
                  'Rs. $grandTotal',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium,
                ),
            gapH16,
            AppButton(
              height: 44.h,
              text: 'Buy',
              onPressed: onClick,
            ),
          ],
        ),
      ),
    );
  }
}
