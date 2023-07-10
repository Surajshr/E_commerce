import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_application/common/widgets/app_button.dart';
import 'package:shopping_application/ui/app_color.dart';
import 'package:shopping_application/ui/app_text_styles.dart';
import '../../../common/widgets/check_out_dialog.dart';
import '../logic/home_view_provider.dart';

class CardItemView extends ConsumerStatefulWidget {
  const CardItemView({super.key});

  @override
  ConsumerState<CardItemView> createState() => _CardItemViewState();
}

class _CardItemViewState extends ConsumerState<CardItemView> {
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
          'Added List',
          style: AppTextStyles.titleMedium.copyWith(
            color: ColorAssets.onBackground,
          ),
        ),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final state = ref.watch(homeViewProvider);
          return state.cardProducts.isNotEmpty
              ? SizedBox(
                  height: 1.sh,
                  width: double.infinity,
                  child: Stack(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.cardProducts.length,
                        itemBuilder: (context, index) {
                          final addedProduct = state.cardProducts[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    16.0,
                                  ),
                                  child: Image.network(
                                    addedProduct.image,
                                    height: 150.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          addedProduct.description,
                                          style: AppTextStyles.bodyMedium,
                                          maxLines: 3,
                                        ),
                                        Text(
                                          addedProduct.title,
                                          style: AppTextStyles.bodySmall,
                                        ),
                                        Text(
                                          'Rs. ${addedProduct.price}/per',
                                          style:
                                              AppTextStyles.bodySmall.copyWith(
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          'Quantity : ${addedProduct.quantity}',
                                          style: AppTextStyles.bodySmall,
                                        ),
                                        Text(
                                          'Total : Rs. ${addedProduct.totalBoughtPrice}',
                                          style:
                                              AppTextStyles.bodySmall.copyWith(
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                    Positioned(
                      top: .73.sh,
                      left: .255.sw,
                      child: AppButton(
                        borderSize: 16.r,
                        width: 150.0,
                        text: 'Check Out',
                        onPressed: () async {
                          await viewModel.calculateCardProductPrice();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CheckOutDialog(
                                title: 'Grand Total!',
                                grandTotal: '${state.totalBoughtProductPrice}',
                                onClick: () {
                                  viewModel.storeBoughtProduct(
                                    boughtProduct: state.cardProducts,
                                  );
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: ColorAssets.success,
                                      content: const Text('Success'),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    )
                  ]),
                )
              : Center(
                  child: Text(
                  'Card List is empty.',
                  style: AppTextStyles.bodyMedium,
                ));
        },
      ),
    );
  }
}
