import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_sizedbox.dart';

class CustomDownloadUploadCard extends StatelessWidget {
  final String icon;
  final String speed;

  const CustomDownloadUploadCard({
    super.key,
    required this.icon,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            icon,
            color: Colors.white,
          ),
          const Gap(0, 5),
          Text(
            speed,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
