import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
    String message) {
  return ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primary,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
