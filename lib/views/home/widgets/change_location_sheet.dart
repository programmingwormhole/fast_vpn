import 'dart:ui';

import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:fast_vpn/views/home/widgets/free_server_list.dart';
import 'package:fast_vpn/views/home/widgets/premium_server_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLocationSheet extends StatelessWidget {
  const ChangeLocationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 4,
          sigmaX: 4,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Center(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    height: 3,
                    width: MediaQuery.sizeOf(context).width * .3,
                    decoration: BoxDecoration(
                      color: AppColors.darkLightBlackWhite.withOpacity(.2),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Change Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkLightBlackWhite,
                    ),
                  ),
                  const Gap(10),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkLightBlackWhite.withOpacity(.01),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: TabBar(
                      unselectedLabelColor:
                          AppColors.darkLightBlackWhite.withOpacity(.5),
                      labelColor: AppColors.primary,
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                        color: Get.isDarkMode
                            ? Colors.black.withOpacity(.2)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: const [
                        Tab(
                          text: 'Free',
                        ),
                        Tab(
                          text: 'Premium',
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        FreeServerList(),
                        PremiumServerList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
