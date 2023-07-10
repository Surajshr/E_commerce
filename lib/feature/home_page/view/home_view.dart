import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/home_view_provider.dart';
import 'widget/product_card.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = ref.read(homeViewProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final state = ref.watch(homeViewProvider);
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final productDetails = state.products[index];
                return ProductCardView(
                  title: productDetails.title,
                  image: productDetails.image,
                  price: productDetails.price,
                  description: productDetails.description,
                  brand: productDetails.brand,
                );
              });
        },
      ),
    );
  }
}
