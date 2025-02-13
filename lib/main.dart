import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fast_vpn/routes/route_destinations.dart';
import 'package:fast_vpn/routes/route_names.dart';
import 'package:fast_vpn/utils/config.dart';
import 'package:fast_vpn/utils/languages.dart';
import 'package:fast_vpn/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,

      // Themes
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,

      // Localizations
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      // Routes
      getPages: RouteDestinations.pages,
      initialRoute: RouteNames.splash,
    );
  }
}
