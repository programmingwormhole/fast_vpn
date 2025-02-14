import 'dart:async';
import 'dart:math';
import 'package:fast_vpn/global_widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import '../global_widgets/custom_alert.dart';
import '../utils/assets_manager.dart';

class HomeController extends GetxController {

  RxBool isConnecting = RxBool(false);
  RxBool isConnected = RxBool(false);
  var downloadSpeed = '0 MB/s'.obs;
  var uploadSpeed = '0 MB/s'.obs;

  // Connected Time
  var elapsedSeconds = 0.obs;
  Timer? _timer;

  void connectServer () {
    isConnecting.value = true;

    Future.delayed(const Duration(seconds: 3), () {
      isConnecting.value = false;
      isConnected.value = true;
      startUpdatingSpeed();
      startTimer();
    });
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedSeconds.value++;
    });
  }

  String get formattedTime {
    int hours = elapsedSeconds.value ~/ 3600;
    int minutes = (elapsedSeconds.value % 3600) ~/ 60;
    int seconds = elapsedSeconds.value % 60;

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  void startUpdatingSpeed() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      downloadSpeed.value = '${(Random().nextDouble() * 100).toStringAsFixed(1)} MB/s';
      uploadSpeed.value = '${(Random().nextDouble() * 50).toStringAsFixed(1)} MB/s';
    });
  }

  void disconnectServer () {
    Get.dialog(
      CustomAlert(
        title: 'Disconnect',
        description: 'Do you want to disconnect?',
        buttonText: 'Disconnect',
        secondButtonText: 'Cancel',
        image: AnimationManager.success,
        isAnimated: true,
        showIcon: false,
        onSecondButtonTap: () => Get.back(),
        onButtonTap: () {
          isConnected.value = false;
          _timer!.cancel();
          elapsedSeconds.value = 0;
          update();
          Get.back();
          snackBar('Disconnected from the server successfully!');
        },
      ),
      barrierDismissible: true,
    );
  }

  @override
  void onClose() {
    super.onClose();
    _timer!.cancel();
  }

}