import 'package:fast_vpn/models/server_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/assets_manager.dart';

class CustomLocationTile extends StatelessWidget {
  final ServerModel server;
  final Function()? onTap;

  const CustomLocationTile({super.key, required this.server, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(Get.isDarkMode ? .1 : .7),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black.withOpacity(.1),
            )),
        child: ListTile(
          leading: Container(
            height: 30,
            width: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(
                  server.flag,
                ),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(8),
          ),
          title: Text(
            server.country,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          subtitle: Text(server.server),
          trailing: SvgPicture.asset(
            server.networkWave == 3
                ? SvgManager.internetFull
                : server.networkWave == 2
                    ? SvgManager.internetTwo
                    : SvgManager.internetOne,
          ),
        ),
      ),
    );
  }
}
