import 'package:fast_vpn/controllers/forgot_password_controller.dart';
import 'package:fast_vpn/global_widgets/custom_button.dart';
import 'package:fast_vpn/global_widgets/custom_otp_field.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/assets_manager.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../components/text_gradient_paint.dart';

class OtpVerifyView extends StatelessWidget {
  const OtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

    if (!controller.isSend.value) {
      controller.isSend.value = true;
      controller.startTimer();
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verification',
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
                    Text(
                      'Enter the verification code we send to ${controller.email.value}.',
                      textAlign: TextAlign.center,
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomOtpField(
                            onChanged: (value) {
                              controller.otp1.value = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }

                              if (value.isEmpty) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),
                        ),
                        const Gap(0, 10),
                        Expanded(
                          child: CustomOtpField(
                            onChanged: (value) {
                              controller.otp2.value = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }

                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        ),
                        const Gap(0, 10),
                        Expanded(
                          child: CustomOtpField(
                            onChanged: (value) {
                              controller.otp3.value = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }

                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        ),
                        const Gap(0, 10),
                        Expanded(
                          child: CustomOtpField(
                            onChanged: (value) {
                              controller.otp4.value = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }

                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        ),
                        const Gap(0, 10),
                        Expanded(
                          child: CustomOtpField(
                            onChanged: (value) {
                              controller.otp5.value = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }

                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        ),
                        const Gap(0, 10),
                        Expanded(
                          child: CustomOtpField(
                            onChanged: (value) {
                              controller.otp6.value = value;
                              if (value.length == 1) {
                                FocusScope.of(context).unfocus();
                              }

                              if (value.isEmpty) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Didn't receive code?"),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgManager.clock, color: AppColors.darkLightBlackWhite,),
                        const Gap(0, 5),
                        Obx(
                          () => Text(
                            '00 : ${controller.secondsRemaining.value.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: controller.isButtonEnabled.value
                            ? () {
                                controller.resendCode();
                              }
                            : null,
                        child: Text(
                          'Resend Code',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.isButtonEnabled.value
                                ? AppColors.primary
                                : Colors.grey, // Disabled state color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Obx(
                      () => CustomButton(
                        isLoading: controller.isVerifying.value,
                        title: 'Verify',
                        onTap: controller.otp1.isEmpty ||
                                controller.otp2.isEmpty ||
                                controller.otp3.isEmpty ||
                                controller.otp4.isEmpty ||
                                controller.otp5.isEmpty ||
                                controller.otp6.isEmpty
                            ? null
                            : controller.verifyOtp,
                        buttonType: controller.otp1.isEmpty ||
                                controller.otp2.isEmpty ||
                                controller.otp3.isEmpty ||
                                controller.otp4.isEmpty ||
                                controller.otp5.isEmpty ||
                                controller.otp6.isEmpty
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
