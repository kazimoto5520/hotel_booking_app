import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/ui/custom_app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Favorites',
      ),
      body: Center(
        child: Text('Your favorite hotels will appear here'),
      ),
    );
  }
}