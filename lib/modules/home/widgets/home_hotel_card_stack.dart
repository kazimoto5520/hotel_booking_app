import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/local/home_hotel_model.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_hotel_card.dart';

class HomeHotelCardStack extends StatelessWidget {
  const HomeHotelCardStack({
    super.key,
    required this.hotels,
    this.height = 260,
  });

  final List<HomeHotelModel> hotels;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: hotels.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == hotels.length - 1 ? 0 : 16,
            ),
            child: HomeHotelCard(hotel: hotels[index]),
          );
        },
      ),
    );
  }
}
