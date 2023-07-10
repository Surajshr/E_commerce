import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../ui/app_color.dart';
import '../../../../ui/app_text_styles.dart';
import '../../logic/home_view_provider.dart';

class ProductCardView extends ConsumerWidget {
  const ProductCardView({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
  }) : super(key: key);

  final String title;
  final String image;
  final String price;
  final String description;
  final String brand;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeViewProvider.notifier);
    return GestureDetector(
      onTap: () {
        viewModel.goToDetailPage(
          context: context,
          price: price,
          description: description,
          title: title,
          brand: brand,
          image: image,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: Container(
          // height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorAssets.onBackground.withOpacity(0.07),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                    ],
                  ),
                  height: 200.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: AppTextStyles.bodyMedium,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rs .$price',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
