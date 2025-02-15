import 'package:fast_vpn/controllers/home_controller.dart';
import 'package:fast_vpn/global_widgets/custom_location_tile.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreeServerList extends StatelessWidget {
  const FreeServerList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return ListView.separated(
      itemBuilder: (_, index) {
        return CustomLocationTile(
          server: controller.servers[index],
          onTap: () {
            controller.connectServer(controller.servers[index]);
            Get.back();
          },
        );
      },
      separatorBuilder: (_, index) => const Gap(10),
      itemCount: controller.servers.length,
    );
  }
}
