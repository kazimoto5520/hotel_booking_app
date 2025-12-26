import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_theme.dart';
import 'package:hotel_booking_app/modules/onboarding/views/onboarding_screen.dart';

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking App',
      theme: AppTheme.lightTheme,
      home: OnboardingScreen(),
    );
  }
}
