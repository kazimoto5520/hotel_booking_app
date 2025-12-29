import 'package:flutter/material.dart';

class HotelSkeleton extends StatelessWidget {
  const HotelSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
