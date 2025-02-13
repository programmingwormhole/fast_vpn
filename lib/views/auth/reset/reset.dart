import 'package:fast_vpn/components/text_gradient_paint.dart';
import 'package:fast_vpn/controllers/forgot_password_controller.dart';
import 'package:fast_vpn/controllers/register_controller.dart';
import 'package:fast_vpn/global_widgets/custom_button.dart';
import 'package:fast_vpn/global_widgets/custom_field.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Change Password',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 25,
                                foreground: customTextGradient(),
                              ),
                            ),
                            Image.asset(
                              AnimationManager.lock.path,
                              width: 50,
                            ),
                          ],
                        ),
                        const Text(
                          'To recover your account please enter a new password.',
                          textAlign: TextAlign.center,
                        ),
                        const Gap(20),
                        Obx(
                          () => CustomField(
                            label: 'Password',
                            hintText: 'Enter password',
                            prefixIcon: SvgManager.password,
                            onChanged: (p0) => controller.password.value = p0,
                            suffixIcon: IconButton(
                              onPressed: controller.changePassVisibility,
                              icon: SvgPicture.asset(
                                controller.isSecured
                                    ? SvgManager.eyeOpen
                                    : SvgManager.eyeClosed,
                                color: AppColors.primary.withOpacity(.5),
                              ),
                            ),
                            isSecured: controller.isSecured,
                          ),
                        ),
                        Obx(
                          () => CustomField(
                            label: 'Confirm Password',
                            hintText: 'Re-Enter your password',
                            prefixIcon: SvgManager.password,
                            onChanged: (p0) => controller.cPassword.value = p0,
                            suffixIcon: IconButton(
                              onPressed: controller.changeCPassVisibility,
                              icon: SvgPicture.asset(
                                controller.cPassIsSecured
                                    ? SvgManager.eyeOpen
                                    : SvgManager.eyeClosed,
                                color: AppColors.primary.withOpacity(.5),
                              ),
                            ),
                            isSecured: controller.cPassIsSecured,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Obx(
                      () => CustomButton(
                        title: 'Change Password',
                        isLoading: controller.isLoading.value,
                        onTap:
                                controller.password.isEmpty ||
                                controller.cPassword.isEmpty
                            ? null
                            : controller.resetPassword,
                        buttonType:
                                controller.password.isEmpty ||
                                controller.cPassword.isEmpty
                            ? ButtonType.soft
                            : ButtonType.normal,
                      ),
                    ),
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
