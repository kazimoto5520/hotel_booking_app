import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/ui/custom_app_bar.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'My Bookings',
      ),
      body: Center(
        child: Text('Your bookings will appear here'),
      ),
    );
  }
}