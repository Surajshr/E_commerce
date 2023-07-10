import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_application/feature/home_page/logic/home_view_provider.dart';
import 'package:shopping_application/feature/home_page/view/home_view.dart';
import 'package:shopping_application/ui/app_color.dart';

import 'card_items_view.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = ref.read(homeViewProvider.notifier);
    super.initState();
  }

  final List<Widget> children = [
    const HomeView(),
    const CardItemView(),
  ];

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(
      homeViewProvider.select((state) => state.index),
    );
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.black.withOpacity(.1),
          )
        ]),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
            child: GNav(
                selectedIndex: index,
                onTabChange: viewModel.changePage,
                rippleColor: ColorAssets.background,
                hoverColor: ColorAssets.background,
                haptic: true,
                tabBorderRadius: 30.r,
                tabActiveBorder: Border.all(
                  color: ColorAssets.primary,
                  width: 2,
                ),
                tabBorder: Border.all(color: Colors.grey, width: 1),
                curve: Curves.linear,
                duration: const Duration(milliseconds: 200),
                gap: 12.w,
                activeColor: ColorAssets.primary,
                iconSize: 30.r,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                tabs: const [
                  GButton(
                    icon: CupertinoIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: CupertinoIcons.shopping_cart,
                    text: 'Card',
                  )
                ]),
          ),
        ),
      ),
      body: children.elementAt(index),
    ));
  }
}
