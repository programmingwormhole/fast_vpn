import 'package:fast_vpn/controllers/subscription_controller.dart';
import 'package:fast_vpn/global_widgets/custom_app_bar.dart';
import 'package:fast_vpn/global_widgets/custom_button.dart';
import 'package:fast_vpn/global_widgets/custom_premium_feature_card.dart';
import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/global_widgets/custom_subscription_plan_card.dart';
import 'package:fast_vpn/routes/route_names.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumPlanView extends StatelessWidget {
  const PremiumPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    List premiumFeatures = [
      {'title': 'Multi-Device', 'subtitle': 'Use on Multiple Devices.'},
      {'title': 'Faster', 'subtitle': 'Unlimited bandwidth.'},
      {'title': 'All Server', 'subtitle': 'All servers in 100+ countries.'},
    ];

    List subscriptionPlan = [
      {
        'duration': '1 Month',
        'price': 1.99,
      },
      {
        'duration': '6 Month',
        'price': 9.99,
      },
      {
        'duration': '1 Year',
        'price': 16.99,
      },
      {
        'duration': '2 Year',
        'price': 31.99,
      },
    ];

    final controller = Get.put(SubscriptionController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.primary,
        title: 'Get Premium',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              children: List.generate(
                premiumFeatures.length,
                (index) => CustomPremiumFeatureCard(
                  title: premiumFeatures[index]['title'],
                  subtitle: premiumFeatures[index]['subtitle'],
                ),
              ),
            ),
            Gap(10),
            const Text(
              'Select Your Subscription',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Gap(20),
            Column(
              children: List.generate(
                subscriptionPlan.length,
                (index) => Obx(
                  () => CustomSubscriptionPlanCard(
                    plan: subscriptionPlan[index],
                    isSelected: controller.selectedPlan.value == index,
                    onTap: () => controller.selectedPlan.value = index,
                  ),
                ),
              ),
            ),
            const Gap(10),
            CustomButton(
              title: 'Subscribe',
              backgroundColor: AppColors.secondary,
              buttonType: ButtonType.normal,
              onTap: () => Get.toNamed(RouteNames.payment),
            )
          ],
        ),
      ),
    );
  }
}
