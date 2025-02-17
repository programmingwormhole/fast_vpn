import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_manager.dart';
import '../utils/colors.dart';

class CustomPremiumFeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomPremiumFeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          SvgManager.done,
          color: AppColors.sameThemeColor,
          height: 35,
          width: 35,
        ),
        trailing: SvgPicture.asset(
          SvgManager.crownFilled,
          color: AppColors.sameThemeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.sameThemeColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: AppColors.sameThemeColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
