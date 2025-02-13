import 'dart:async';

import 'package:fast_vpn/utils/colors.dart';
import 'package:get/get.dart';

import '../global_widgets/custom_alert.dart';
import '../global_widgets/custom_snackbar.dart';
import '../routes/route_names.dart';
import '../utils/assets_manager.dart';

class RegisterController extends GetxController {
  final RxBool _isSecured = RxBool(true);

  bool get isSecured => _isSecured.value;

  final RxBool _cPassIsSecured = RxBool(true);

  bool get cPassIsSecured => _cPassIsSecured.value;

  void changePassVisibility() => _isSecured.value = !_isSecured.value;

  void changeCPassVisibility() =>
      _cPassIsSecured.value = !_cPassIsSecured.value;

  final RxString name = RxString('');
  final RxString email = RxString('');
  final RxString password = RxString('');
  final RxString cPassword = RxString('');

  final RxBool isLoading = RxBool(false);

  void register () {
    if (!GetUtils.isEmail(email.value)) {
      snackBar('Please enter a valid email address!');
      return;
    }

    if (password.value != cPassword.value) {
      snackBar('Confirmation password mismatched!');
      return;
    }

    isLoading.value = true;

    Timer(
      const Duration(seconds: 3),
      () {
        isLoading.value = false;
        Get.dialog(
          CustomAlert(
            title: 'Success',
            description: 'Hey ${name.value}, Your registration has been successfully completed!',
            buttonText: 'Go To Home',
            image: AnimationManager.success,
            isAnimated: true,
            onButtonTap: () => Get.offAllNamed(RouteNames.home),
            lottieColor: AppColors.primary,
          ),
          barrierDismissible: false,
        );
      },
    );
  }
}
