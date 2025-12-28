import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/modules/favourites/views/favourites_screen.dart';
import 'package:hotel_booking_app/modules/home/views/home_screen.dart';
import 'package:hotel_booking_app/modules/main/controllers/main_controller.dart';
import 'package:hotel_booking_app/modules/bookings/views/bookings_screen.dart';
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
        () => NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changeTab,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: 'Bookings',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
