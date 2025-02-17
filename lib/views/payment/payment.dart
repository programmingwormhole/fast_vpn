import 'package:fast_vpn/global_widgets/custom_app_bar.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: 'Payment',
        titleColor: AppColors.primary,
      ),
    );
  }
}
