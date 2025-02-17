import 'package:fast_vpn/global_widgets/custom_sizedbox.dart';
import 'package:fast_vpn/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomSubscriptionPlanCard extends StatelessWidget {
  final Map plan;
  final bool isSelected;
  final Function()? onTap;

  const CustomSubscriptionPlanCard({
    super.key,
    required this.plan,
    this.isSelected = false, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plan['duration'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$${plan['price']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const Gap(0, 10),
                  if (isSelected)
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 7,
                        ),
                      ),
                    )
                  else
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
