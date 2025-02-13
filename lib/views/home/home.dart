import 'package:fast_vpn/components/text_gradient_paint.dart';
import 'package:fast_vpn/global_widgets/custom_app_bar.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (!Get.isDarkMode) Column(
              children: [
                const Gap(15),
                ImageManager.worldMap.image(),
              ],
            ) else Column(
              children: [
                const Gap(15),
                ImageManager.worldMapDark.image(),
              ],
            ),
            Column(
              children: [
                const CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Gap(15),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(Get.isDarkMode ? .1 : .7),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(SvgManager.global),
                          ),
                          title: Text('Best Location',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              foreground: customTextGradient()
                          ),),
                          subtitle: const Text('Fastest Server'),
                          trailing: SvgPicture.asset(SvgManager.internetWaves),
                        ),
                      ),
                      const Gap(20),
                      Container(
                        width: MediaQuery.sizeOf(context).width * .6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(600),
                          border: Border.all(
                            color: AppColors.primary,
                          )
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Change Location',
                            style: TextStyle(
                              foreground: customTextGradient(),
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),),
                            SvgPicture.asset(SvgManager.arrowTop)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
