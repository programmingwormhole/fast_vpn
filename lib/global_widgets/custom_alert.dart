import 'dart:ui';

import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'custom_button.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final void Function()? onButtonTap;
  final String? secondButtonText;
  final void Function()? onSecondButtonTap;
  final String image;
  final bool? isAnimated;
  final String? buttonIcon;
  final Color? lottieColor;
  final bool showIcon;

  const CustomAlert({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonTap,
    required this.image,
    this.isAnimated,
    this.secondButtonText,
    this.onSecondButtonTap,
    this.buttonIcon,
    this.lottieColor,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (showIcon)...[
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: isAnimated == true
                            ? Lottie.asset(image,
                            delegates: LottieDelegates(
                              values: [
                                ValueDelegate.color(
                                  const ['**'], // Apply to all layers
                                  value:
                                  lottieColor, // Change to your desired color
                                ),
                              ],
                            ))
                            : Image.asset(image),
                      ),
                    ],
                    Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.darkLightBlackWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.darkLightBlackWhite.withOpacity(.5),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Column(
                      children: [
                        CustomButton(
                          title: buttonText,
                          onTap: onButtonTap ?? () => Get.back(),
                        ),
                        if (secondButtonText != null) ...[
                          const Gap(10),
                          CustomButton(
                            title: secondButtonText!,
                            onTap: onSecondButtonTap ?? () => Get.back(),
                            buttonType: ButtonType.soft,
                          ),
                        ]
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
