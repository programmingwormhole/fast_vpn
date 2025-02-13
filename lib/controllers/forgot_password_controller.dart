import 'dart:async';

import 'package:fast_vpn/global_widgets/custom_snackbar.dart';
import 'package:fast_vpn/routes/route_names.dart';
import 'package:get/get.dart';

import '../global_widgets/custom_alert.dart';
import '../utils/assets_manager.dart';
import '../utils/colors.dart';

class ForgotPasswordController extends GetxController {
  final RxString email = RxString('');

  final RxBool isLoading = RxBool(false);
  final RxBool isVerifying = RxBool(false);

  void forgotRequest() {
    if (!GetUtils.isEmail(email.value)) {
      snackBar('Please enter a valid email address!');
      return;
    }

    isLoading.value = true;

    Timer(
      const Duration(seconds: 2),
      () {
        isLoading.value = false;
        Get.dialog(
          CustomAlert(
            title: 'Success',
            description: 'A verification code has been sent to ${email.value}.',
            buttonText: 'Go To Verify',
            image: AnimationManager.success,
            isAnimated: true,
            onButtonTap: () => Get.toNamed(RouteNames.otpVerify),
            lottieColor: AppColors.primary,
          ),
          barrierDismissible: false,
        );
      },
    );
  }

  // Verification
  RxString otp1 = RxString('');
  RxString otp2 = RxString('');
  RxString otp3 = RxString('');
  RxString otp4 = RxString('');
  RxString otp5 = RxString('');
  RxString otp6 = RxString('');

  var secondsRemaining = 30.obs;
  var isButtonEnabled = false.obs;
  Timer? _timer;

  RxBool isSend = RxBool(false);

  void startTimer() {
    isButtonEnabled.value = false;
    _timer?.cancel(); // Cancel any existing timer before starting a new one
    secondsRemaining.value = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
        isButtonEnabled.value = true;
      }
    });
  }

  void resendCode() {
    startTimer();
    snackBar('New verification code has been sent!');
  }

  void verifyOtp() {
    isVerifying.value = true;

    Timer(
      const Duration(seconds: 2),
      () {
        isVerifying.value = false;
        Get.dialog(
          CustomAlert(
            title: 'Success',
            description: 'You have successfully verified your OTP.',
            buttonText: 'Change Password',
            image: AnimationManager.success,
            isAnimated: true,
            onButtonTap: () => Get.toNamed(RouteNames.resetPassword),
            lottieColor: AppColors.primary,
          ),
          barrierDismissible: false,
        );
      },
    );
  }

  // Reset Password
  final RxBool _isSecured = RxBool(true);

  bool get isSecured => _isSecured.value;

  final RxBool _cPassIsSecured = RxBool(true);

  bool get cPassIsSecured => _cPassIsSecured.value;

  void changePassVisibility() => _isSecured.value = !_isSecured.value;

  void changeCPassVisibility() =>
      _cPassIsSecured.value = !_cPassIsSecured.value;

  final RxString password = RxString('');
  final RxString cPassword = RxString('');

  void resetPassword() {

    if (password.value != cPassword.value) {
      snackBar('Confirmation password is mismatched!');
      return;
    }

    isLoading.value = true;

    Timer(
      const Duration(seconds: 2),
      () {
        isLoading.value = false;
        Get.dialog(
          CustomAlert(
            title: 'Success',
            description: 'Great, Your account has been successfully recovered.',
            buttonText: 'Back to Login',
            image: AnimationManager.success,
            isAnimated: true,
            onButtonTap: () => Get.offAllNamed(RouteNames.login),
            lottieColor: AppColors.primary,
          ),
          barrierDismissible: false,
        );
      },
    );
  }
}
