import 'package:get/get.dart';
import 'package:hotel_booking_app/core/routes/app_routes.dart';
import 'package:hotel_booking_app/modules/auth/views/authentication_screen.dart';
import 'package:hotel_booking_app/modules/auth/views/otp_verification_screen.dart';
import 'package:hotel_booking_app/modules/home/views/home_screen.dart';
import 'package:hotel_booking_app/modules/main/views/main_screen.dart';
import 'package:hotel_booking_app/modules/onboarding/views/onboarding_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => AuthenticationScreen(),
       transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => OtpVerificationScreen(),
       transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}