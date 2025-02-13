import 'dart:async';

import 'package:fast_vpn/components/custom_gradient.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/routes/route_names.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteNames.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: customGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(SvgManager.shield),
                    Image.asset(ImageManager.favicon.path)
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      AppConfig.appName,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Version 2.1.0',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Protect your privacy at\nlightning speed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(20),
                    LinearProgressIndicator(
                      minHeight: 5,
                      color: Colors.white,
                      backgroundColor: Colors.white.withOpacity(.3),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
