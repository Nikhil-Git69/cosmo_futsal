import 'package:flutter/material.dart';
import 'package:cosmo_futsal/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final double verticalPadding;
  final BorderRadiusGeometry borderRadius;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 16,
    this.verticalPadding = 14,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    assert(text != null || icon != null, 'Either text or icon must be provided');

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          backgroundColor: backgroundColor ?? AppColors.Primary,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: icon ?? Text(
          text!,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
