import 'package:flutter/material.dart';

class ColorAssets {
  static Color background = const Color(0xffFAFAFF);
  static Color onBackground = const Color(0xff151515);
  static Color container = const Color(0xffF3F3FF);
  static Color onContainer = const Color(0xff1D1C20);
  static Color bottomGradient = const Color(0xff364FFF);
  static Color onGradient = const Color(0xffFFFFFF);
  static Color primary = const Color(0xff845BF9);
  static Color onPrimary = const Color(0xffFBFFFE);
  static Color secondary = const Color(0xffFFc90B);
  static Color onSecondary = const Color(0xff070707);
  static Color tertiary = const Color(0xff364FFF);
  static Color onTertiary = const Color(0xffFFFFFF);
  static Color primaryVariant = const Color(0xffECE6FE);
  static Color onPrimaryVariant = const Color(0xff845BF9);
  static Color topGradient = const Color(0xff845BF9);

  static Color success = const Color(0xff048848);
  static Color onSuccess = const Color(0xffFFFFFF);
  static Color successVariant = const Color(0xffE1FFEF);
  static Color onSuccessVariant = const Color(0xff151515);
  static Color error = const Color(0xffE51B1B);
  static Color onError = const Color(0xffFFFFFF);
  static Color errorVariant = const Color(0xffFFEBEB);
  static Color onErrorVariant = const Color(0xffFFEBEB);
  static Color info = const Color(0xff2174EE);
  static Color onInfo = const Color(0xffE9ECF5);
  static Color infoVariant = const Color(0xffD0E3FF);
  static Color onInfoVariant = const Color(0xff2174EE);
  static Color disabledText = const Color(0xff6A6A6A);
  static Color disabledContainer = const Color(0xffE1E1E1);
  static Color onDisabledContainer = const Color(0xff848484);
  static Color containerVariant = const Color(0xffE8E8F9);
  static Color onContainerVariant = const Color(0xff383838);
}

final songsGradient = LinearGradient(
  colors: [
    ColorAssets.topGradient,
    ColorAssets.bottomGradient,
  ],
  stops: const [0, 0.88],
);
