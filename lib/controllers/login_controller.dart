import 'dart:async';

import 'package:fast_vpn/global_widgets/custom_snackbar.dart';
import 'package:fast_vpn/routes/route_names.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool _isSecured = RxBool(true);

  bool get isSecured => _isSecured.value;

  void changeVisibility() => _isSecured.value = !_isSecured.value;

  final RxString email = RxString('');
  final RxString password = RxString('');

  final RxBool isLoading = RxBool(false);

  void login() {

    if (!GetUtils.isEmail(email.value)) {
      snackBar('Please enter a valid email address!');
      return;
    }

    isLoading.value = true;

    Timer(
      const Duration(seconds: 3),
      () {
        isLoading.value = false;
        Get.offAllNamed(RouteNames.home);
      },
    );
  }
}
