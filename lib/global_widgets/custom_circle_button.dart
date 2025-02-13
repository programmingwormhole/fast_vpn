import 'package:fast_vpn/components/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

class CircleButton extends StatelessWidget {
  final String icon;
  final bool gradientType;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const CircleButton({
    super.key,
    required this.icon,
    this.gradientType = false,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: backgroundColor ?? (Get.isDarkMode && !gradientType ? Colors.white.withOpacity(.2) : Colors.white),
          gradient: gradientType ? customGradient() : null,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        padding: const EdgeInsets.all(7),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
