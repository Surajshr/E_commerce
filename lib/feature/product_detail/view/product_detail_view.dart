import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_application/common/widgets/app_button.dart';
import 'package:shopping_application/core/model/product_model/product_model.dart';
import 'package:shopping_application/feature/home_page/view/widget/quantity_increment_button.dart';
import 'package:shopping_application/ui/app_color.dart';
import 'package:shopping_application/ui/app_text_styles.dart';
import 'package:shopping_application/ui/src/gap.dart';

import '../../home_page/logic/home_view_provider.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  const ProductDetailView({
    super.key,
    required this.price,
    required this.description,
    required this.title,
    required this.brand,
    required this.image,
  });

  final String title;
  final String image;
  final String description;
  final String brand;
  final String price;

  @override
  ConsumerState<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = ref.read(homeViewProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorAssets.background,
        title: Text(
          widget.title,
          style: AppTextStyles.titleMedium.copyWith(
            color: ColorAssets.onBackground,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: ColorAssets.onBackground,
          ),
        ),
      ),
      body: SizedBox(
        height: 1.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: .4.sh,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyles.titleSmall,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs. ',
                        style: AppTextStyles.bodyMedium,
                      ),
                      Text(
                        '${widget.price} . ',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'by: ${widget.brand} . ',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: ColorAssets.disabledText,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: AppTextStyles.bodyMedium,
                  ),
                  gapH16,
                  Row(
                    children: [
                      Text(
                        'Quantity',
                        style: AppTextStyles.bodyMedium,
                      ),
                      gapW16,
                      QuantityIncrementButton(
                        price: widget.price,
                      ),
                    ],
                  ),
                  gapH8,
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final state = ref.watch(homeViewProvider);
                      return Text(
                        'Total: Rs. ${state.totalPrice}',
                        style: AppTextStyles.bodyLarge,
                      );
                    },
                  ),
                  gapH16,
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final state = ref.watch(homeViewProvider);
                      return AppButton(
                        borderSize: 20.r,
                        text: 'Add to Card',
                        onPressed: () async {
                          final product = CardProductModel(
                            title: widget.title,
                            price: widget.price,
                            image: widget.image,
                            brand: widget.brand,
                            description: widget.description,
                            quantity: state.productQuantity.toString(),
                            totalBoughtPrice: state.totalPrice.toString(),
                          );
                          final success = await viewModel.addItemTOCard(
                            productModel: product,
                          );
                          viewModel.showSnackBar(
                            context: context,
                            message: success,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
