import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_application/ui/app_color.dart';
import 'package:shopping_application/ui/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonColor,
    this.width,
    this.height,
    this.textStyle,
    this.isLoading = false,
    this.textAlign,
    this.borderSize,
  });

  final Color? buttonColor;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? borderSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (!states.contains(MaterialState.disabled)) {
                return buttonColor ?? ColorAssets.primary;
              }
              return null; // Defer to the widget's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white;
              return null; // Defer to the widget's default.
            },
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderSize ?? 8.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorAssets.onPrimary,
                ),
              )
            : Text(
                text,
                style: textStyle ??
                    AppTextStyles.titleSmall.copyWith(
                      color: ColorAssets.onPrimary,
                    ),
                textAlign: textAlign ?? TextAlign.center,
              ),
      ),
    );
  }
}
