import 'dart:async';
import 'dart:math';
import 'package:fast_vpn/global_widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import '../global_widgets/custom_alert.dart';
import '../models/server_model.dart';
import '../utils/assets_manager.dart';

class HomeController extends GetxController {
  RxBool isConnecting = RxBool(false);
  RxBool isConnected = RxBool(false);
  var downloadSpeed = '0 MB/s'.obs;
  var uploadSpeed = '0 MB/s'.obs;

  // Connected Time
  var elapsedSeconds = 0.obs;
  Timer? _timer;

  void connectServer(ServerModel server) {
    if (isConnected.value) {
      isConnected.value = false;
      _timer!.cancel();
      elapsedSeconds.value = 0;
    }

    isConnecting.value = true;
    selectedServer.value = server;

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
      downloadSpeed.value =
          '${(Random().nextDouble() * 100).toStringAsFixed(1)} MB/s';
      uploadSpeed.value =
          '${(Random().nextDouble() * 50).toStringAsFixed(1)} MB/s';
    });
  }

  void disconnectServer() {
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

  List<ServerModel> servers = [
    ServerModel(
      flag:
          'https://cdn.pixabay.com/photo/2013/07/13/12/03/flag-159070_1280.png',
      country: 'United Kingdom',
      server: 'London',
      networkWave: 3,
      ip: '18.16.125.20',
    ),
    ServerModel(
      flag:
          'https://flagsireland.com/cdn/shop/products/CanadaFlag.png?v=1678435840',
      country: 'Canada',
      server: 'Victoria',
      networkWave: 3,
      ip: '288.161.125.20',
    ),
    ServerModel(
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/2560px-Flag_of_Germany.svg.png',
      country: 'Germany',
      server: 'Berlin',
      networkWave: 2,
      ip: '198.144.20.3',
    ),
    ServerModel(
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/640px-Flag_of_Thailand.svg.png',
      country: 'Thailand',
      server: 'Bangkok',
      networkWave: 1,
      ip: '158.27.0.58',
    ),
    ServerModel(
      flag:
      'https://cdn.pixabay.com/photo/2013/07/13/12/03/flag-159070_1280.png',
      country: 'United Kingdom',
      server: 'London',
      networkWave: 3,
      ip: '18.16.125.20',
    ),
    ServerModel(
      flag:
      'https://flagsireland.com/cdn/shop/products/CanadaFlag.png?v=1678435840',
      country: 'Canada',
      server: 'Victoria',
      networkWave: 3,
      ip: '288.161.125.20',
    ),
    ServerModel(
      flag:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/2560px-Flag_of_Germany.svg.png',
      country: 'Germany',
      server: 'Berlin',
      networkWave: 2,
      ip: '198.144.20.3',
    ),
    ServerModel(
      flag:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/640px-Flag_of_Thailand.svg.png',
      country: 'Thailand',
      server: 'Bangkok',
      networkWave: 1,
      ip: '158.27.0.58',
    ),
  ];

  Rxn<ServerModel> selectedServer = Rxn<ServerModel>();

  @override
  void onClose() {
    super.onClose();
    _timer!.cancel();
  }
}
