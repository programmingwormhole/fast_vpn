import 'package:fast_vpn/components/custom_gradient.dart';
import 'package:fast_vpn/components/text_gradient_paint.dart';
import 'package:fast_vpn/controllers/home_controller.dart';
import 'package:fast_vpn/global_widgets/custom_app_bar.dart';
import 'package:fast_vpn/global_widgets/custom_download_upload_card.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:fast_vpn/views/home/widgets/change_location_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: Stack(
        children: [
          if (!Get.isDarkMode)
            SafeArea(
              child: Column(
                children: [
                  const Gap(15),
                  ImageManager.worldMap.image(),
                ],
              ),
            )
          else
            SafeArea(
              child: Column(
                children: [
                  const Gap(15),
                  ImageManager.worldMapDark.image(),
                ],
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                            color: Colors.white
                                .withOpacity(Get.isDarkMode ? .1 : .7),
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
                            title: Text(
                              'Best Location',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  foreground: customTextGradient()),
                            ),
                            subtitle: const Text('Fastest Server'),
                            trailing:
                                SvgPicture.asset(SvgManager.internetWaves),
                          ),
                        ),
                        const Gap(20),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return const ChangeLocationSheet();
                              },
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * .6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(600),
                                border: Border.all(
                                  color: AppColors.primary,
                                )),
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Change Location',
                                  style: TextStyle(
                                      foreground: customTextGradient(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SvgPicture.asset(SvgManager.arrowTop)
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Obx(
                          () => controller.isConnected.value
                              ? Column(
                                  children: [
                                    Text(
                                      controller.formattedTime,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 60,
                                          foreground: customTextGradient()),
                                    ),
                                    const Text(
                                      'Your IP: 127.0.0.1',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                )
                              : const Gap(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const HomeBottom()
            ],
          )
        ],
      ),
    );
  }
}

class HomeBottom extends StatelessWidget {
  const HomeBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Obx(
      () => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: customGradient(),
              ),
            ),
          ),
          Positioned(
            top: -80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: () => controller.isConnected.value
                      ? controller.disconnectServer()
                      : controller.connectServer(),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.isConnected.value
                          ? AppColors.primary.withOpacity(.2)
                          : Colors.white.withOpacity(.2),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.4),
                      ),
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.all(25),
                        child: SvgPicture.asset(
                          controller.isConnected.value
                              ? SvgManager.disconnect
                              : SvgManager.power,
                        ),
                      ),
                    ),
                  ),
                ),
                if (controller.isConnecting.value ||
                    controller.isConnected.value)
                  InkWell(
                    onTap: controller.isConnected.value
                        ? controller.disconnectServer
                        : null,
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: CircularProgressIndicator(
                        strokeWidth: 12,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                        strokeCap: StrokeCap.round,
                        value: controller.isConnected.value ? 100 : null,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            child: controller.isConnected.value
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomDownloadUploadCard(
                              icon: SvgManager.download,
                              speed: controller.downloadSpeed.value,
                            ),
                          ),
                          const Gap(0, 15),
                          Expanded(
                            child: CustomDownloadUploadCard(
                              icon: SvgManager.upload,
                              speed: controller.uploadSpeed.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Text(
                    controller.isConnecting.value
                        ? 'Connecting...'
                        : 'Tap to Connect',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 30);
    path.quadraticBezierTo(size.width / 2, -30, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
