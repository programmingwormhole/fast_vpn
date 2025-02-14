import 'package:get/get.dart';

import '../global_widgets/custom_alert.dart';
import '../utils/assets_manager.dart';

class HomeController extends GetxController {

  RxBool isConnecting = RxBool(false);
  RxBool isConnected = RxBool(false);

  void connectServer () {
    isConnecting.value = true;

    Future.delayed(const Duration(seconds: 3), () {
      isConnecting.value = false;
      isConnected.value = true;
    });
  }

  void disconnectServer () {
    print('dfgdf');
    // Get.dialog(
    //   CustomAlert(
    //     title: 'Success',
    //     description: 'Your account has been successfully created!',
    //     buttonText: 'Go To Home',
    //     image: AnimationManager.success,
    //     isAnimated: true,
    //   ),
    //   barrierDismissible: false,
    // );
  }

}