import 'package:fast_vpn/controllers/forgot_password_controller.dart';
import 'package:fast_vpn/controllers/login_controller.dart';
import 'package:fast_vpn/global_widgets/custom_button.dart';
import 'package:fast_vpn/global_widgets/custom_field.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/routes/route_names.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../components/text_gradient_paint.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
                              'Forgot Password',
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
                          'Enter your email and we will send OTP code to recovery the password.',
                          textAlign: TextAlign.center,
                        ),
                        const Gap(20),
                        CustomField(
                          label: 'Email',
                          hintText: 'Enter E-Mail',
                          prefixIcon: SvgManager.email,
                          onChanged: (p0) => controller.email.value = p0,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Obx(
                      () => CustomButton(
                        isLoading: controller.isLoading.value,
                        title: 'Send OTP',
                        onTap:
                            controller.email.isEmpty ? null : controller.forgotRequest,
                        buttonType: controller.email.isEmpty
                            ? ButtonType.soft
                            : ButtonType.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 15,
                          ),
                          Text("Back to"),
                          Gap(0, 5),
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
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
