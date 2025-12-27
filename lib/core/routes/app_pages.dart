import 'package:get/get.dart';
import 'package:hotel_booking_app/core/routes/app_routes.dart';
import 'package:hotel_booking_app/modules/auth/views/authentication_screen.dart';
import 'package:hotel_booking_app/modules/home/home_screen.dart';
import 'package:hotel_booking_app/modules/onboarding/views/onboarding_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const AuthenticationScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
  ];
}