import 'package:fast_vpn/global_widgets/custom_button.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/routes/route_names.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../models/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int _currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(onboardData[index].icon),
                          Column(
                            children: [
                              Text(
                                onboardData[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                onboardData[index].description,
                                style: const TextStyle(
                                  color: AppColors.primary,
                                ),
                              )
                            ],
                          ),
                          const Gap(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardData.length,
                      (index) => Container(
                        height: 10,
                        width: _currentIndex == index ? 8 : 5,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppColors.primary
                              : AppColors.primary.withOpacity(.2),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  CustomButton(
                    title: _currentIndex == onboardData.length - 1
                        ? 'Start Enjoying'
                        : 'Next',
                    onTap: () {
                      if (_currentIndex == onboardData.length - 1) {
                        Get.offAllNamed(RouteNames.login);
                        return;
                      }

                      _controller.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.bounceOut,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<OnboardModel> onboardData = [
  OnboardModel(
    icon: SvgManager.onboardCup,
    title: 'Many prestigious awards',
    description: 'Trusted by over 4 million users.',
  ),
  OnboardModel(
    icon: SvgManager.onboardSheild,
    title: 'Safe and Secured',
    description: 'Military-Grade Encryption.',
  ),
  OnboardModel(
    icon: SvgManager.onboardSheildNetwork,
    title: 'Global Server Coverage',
    description: 'Supports over 1 million servers worldwide.',
  ),
  OnboardModel(
    icon: SvgManager.onboardSupport,
    title: '24/7 Customer Support',
    description: 'Caring help whenever you need.',
  ),
];
