import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/modules/home/controllers/home_controller.dart';

class HomeTabContents extends StatelessWidget {
  const HomeTabContents({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.15),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: _tabContent(
          key: ValueKey(controller.selectedIndex.value),
          context: context,
        ),
      );
    });
  }

  Widget _tabContent({
    required Key key,
    required BuildContext context,
  }) {
    final tab = controller.currentTab;

    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          context,
          'Popular $tab',
          '🔥',
        ),
        const SizedBox(height: 16),

        _hotelCard(),

        const SizedBox(height: 32),

        _sectionTitle(
          context,
          'Nearby Location',
          '🗺️',
        ),
        const SizedBox(height: 16),

        _hotelCard(),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context, String title, String emoji) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(width: 6),
        Text(emoji),
      ],
    );
  }

  Widget _hotelCard() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Hotel Card',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}