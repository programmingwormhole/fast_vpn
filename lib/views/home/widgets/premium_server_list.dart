import 'dart:ui';

import 'package:fast_vpn/controllers/home_controller.dart';
import 'package:fast_vpn/global_widgets/custom_button.dart';
import 'package:fast_vpn/global_widgets/custom_location_tile.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumServerList extends StatelessWidget {
  const PremiumServerList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Stack(
      alignment: Alignment.center,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return CustomLocationTile(
              server: controller.servers[index],
            );
          },
          separatorBuilder: (_, index) => const Gap(10),
          itemCount: controller.servers.length,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(),
        ),
        CustomButton(
          title: 'Unlock Premium',
          svgIcon: SvgManager.crown,
          onTap: () {
            print('sddg');
          },
        )
      ],
    );
  }
}
