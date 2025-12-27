import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/core/routes/app_pages.dart';
import 'package:hotel_booking_app/core/routes/app_routes.dart';
import 'package:hotel_booking_app/core/theme/app_theme.dart';

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hotel Booking App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.pages,
    );
  }
}
