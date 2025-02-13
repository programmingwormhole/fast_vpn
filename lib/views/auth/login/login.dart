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

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

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
                              'Welcome',
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
                          'Please sign in to continue.',
                          textAlign: TextAlign.center,
                        ),
                        const Gap(20),
                        CustomField(
                          label: 'Email',
                          hintText: 'Enter E-Mail',
                          prefixIcon: SvgManager.email,
                          onChanged: (p0) => controller.email.value = p0,
                        ),
                        Obx(
                          () => CustomField(
                            label: 'Password',
                            hintText: 'Enter Password',
                            prefixIcon: SvgManager.password,
                            onChanged: (p0) => controller.password.value = p0,
                            suffixIcon: IconButton(
                              onPressed: controller.changeVisibility,
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
                        InkWell(
                          onTap: () => Get.toNamed(RouteNames.forgotPassword),
                          child: const Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary),
                            ),
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
                        isLoading: controller.isLoading.value,
                        title: 'Sign In',
                        onTap: controller.email.isEmpty ||
                                controller.password.isEmpty
                            ? null
                            : controller.login,
                        buttonType: controller.email.isEmpty ||
                                controller.password.isEmpty
                            ? ButtonType.soft
                            : ButtonType.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const Gap(0, 5),
                        InkWell(
                          onTap: () => Get.toNamed(RouteNames.register),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
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
