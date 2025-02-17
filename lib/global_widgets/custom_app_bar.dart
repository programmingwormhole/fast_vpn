import 'package:fast_vpn/global_widgets/custom_circle_button.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool automaticImplementLeading;
  final List<Widget>? actions;
  final String? title;
  final Color backgroundColor;
  final Color titleColor;

  const CustomAppBar({
    super.key,
    this.leading,
    this.automaticImplementLeading = true,
    this.actions,
    this.title,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leading != null) ...[leading!],
          if (automaticImplementLeading && leading == null) ...[
            CircleButton(
              icon: SvgManager.backArrow,
              onTap: () => Get.back(),
            )
          ],
          title == null
              ? Image.asset(ImageManager.logo.path)
              : Text(
                  title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: titleColor,
                  ),
                ),
          actions != null
              ? Row(
                  children: actions!,
                )
              : const Gap()
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
