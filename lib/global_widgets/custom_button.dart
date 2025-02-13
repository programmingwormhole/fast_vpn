import 'package:fast_vpn/components/custom_gradient.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { normal, soft }

enum ButtonColorType { gradient, solid }

class CustomButton extends StatelessWidget {
  final String title;
  final ButtonType buttonType;
  final ButtonColorType buttonColorType;
  final Color backgroundColor;
  final Color titleColor;
  final double buttonHeight;
  final Function()? onTap;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.title,
    this.buttonType = ButtonType.normal,
    this.backgroundColor = AppColors.primary,
    this.buttonColorType = ButtonColorType.solid,
    this.titleColor = Colors.white,
    this.buttonHeight = 50,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          gradient: customGradient(),
          color: buttonType == ButtonType.soft
              ? backgroundColor.withOpacity(.1)
              : backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: buttonType == ButtonType.soft
                        ? AppColors.primary.withOpacity(.5)
                        : Colors.white,
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: buttonType == ButtonType.soft
                        ? AppColors.primary.withOpacity(.5)
                        : titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
