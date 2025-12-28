import 'package:flutter/material.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_search_tabs.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_title_widget.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_top_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                HomeSearchTabs(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
