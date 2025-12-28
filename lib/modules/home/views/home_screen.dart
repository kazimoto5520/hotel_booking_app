import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/modules/home/controllers/home_controller.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_search_tabs.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_tab_contents.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_title_widget.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_top_profile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopProfile(),
                const SizedBox(height: 24),
                const HomeTitleWidget(),
                const SizedBox(height: 24),
                HomeSearchTabs(controller: controller),
                const SizedBox(height: 24),
                HomeTabContents(controller: controller),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
