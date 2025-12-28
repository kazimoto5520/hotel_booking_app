import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/ui/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Home Screen',
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}