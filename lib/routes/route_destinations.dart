import 'package:fast_vpn/views/auth/forgot/forgot.dart';
import 'package:fast_vpn/views/auth/login/login.dart';
import 'package:fast_vpn/views/auth/otp/otp.dart';
import 'package:fast_vpn/views/auth/register/register.dart';
import 'package:fast_vpn/views/auth/reset/reset.dart';
import 'package:fast_vpn/views/home/home.dart';
import 'package:fast_vpn/views/payment/payment.dart';
import 'package:fast_vpn/views/premium/premium.dart';
import 'package:fast_vpn/views/splash/splash.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:fast_vpn/routes/route_names.dart';

import '../views/onboard/onboard.dart';

class RouteDestinations {
  static List<GetPage> pages = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: RouteNames.onboard,
      page: () => const OnboardView(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: RouteNames.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(
      name: RouteNames.otpVerify,
      page: () => const OtpVerifyView(),
    ),
    GetPage(
      name: RouteNames.resetPassword,
      page: () => const ResetPasswordView(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: RouteNames.premium,
      page: () => const PremiumPlanView(),
    ),
    GetPage(
      name: RouteNames.payment,
      page: () => const PaymentView(),
    ),
  ];
}
