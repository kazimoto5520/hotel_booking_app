import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/modules/favourites/views/favourites_screen.dart';
import 'package:hotel_booking_app/modules/home/views/home_screen.dart';
import 'package:hotel_booking_app/modules/main/controllers/main_controller.dart';
import 'package:hotel_booking_app/modules/bookings/views/bookings_screen.dart';
import 'package:hotel_booking_app/modules/main/widgets/glass_bottom_nav.dart';
import 'package:hotel_booking_app/modules/settings/views/settings_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainController controller = Get.put(MainController());

  final List<Widget> _screens = [
    HomeScreen(),
    const BookingsScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => SafeArea(
          // bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: GlassBottomNav(
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeTab,
            ),
          ),
        ),
      ),
    );
  }
}
