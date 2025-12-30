import 'package:flutter/material.dart';
import 'package:hotel_booking_app/data/local/home_hotel_model.dart';
import 'package:hotel_booking_app/modules/home/widgets/home_hotel_card.dart';

class HomeHotelCardStack extends StatefulWidget {
  const HomeHotelCardStack({
    super.key,
    required this.hotels,
    this.height = 260,
  });

  final List<HomeHotelModel> hotels;
  final double height;

  @override
  State<HomeHotelCardStack> createState() => _HomeHotelCardStackState();
}

class _HomeHotelCardStackState extends State<HomeHotelCardStack> {
  int currentIndex = 0;
  double dragOffset = 0;

  static const double peekOffset = 22;
  static const double scaleStep = 0.04;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height + 32,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            dragOffset += details.delta.dy;
          });
        },
        onVerticalDragEnd: (details) {
          if (dragOffset < -60 && currentIndex < widget.hotels.length - 1) {
            setState(() {
              currentIndex++;
              dragOffset = 0;
            });
          } else if (dragOffset > 60 && currentIndex > 0) {
            setState(() {
              currentIndex--;
              dragOffset = 0;
            });
          } else {
            setState(() {
              dragOffset = 0;
            });
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: List.generate(widget.hotels.length, (index) {
            final distance = index - currentIndex;

            double yOffset;
            double scale;
            double opacity;

            if (distance == 0) {
              // ACTIVE
              yOffset = dragOffset.clamp(-80.0, 80.0);
              scale = 1.0;
              opacity = 1.0;
            } else if (distance > 0) {
              // BELOW (peek cards)
              yOffset = (distance * peekOffset);
              scale = 1.0 - (distance * scaleStep);
              opacity = distance <= 2 ? 1.0 : 0.0;
            } else {
              // ABOVE (previous cards)
              yOffset = -peekOffset;
              scale = 0.98;
              opacity = 0.0;
            }

            return AnimatedPositioned(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              top: yOffset,
              left: 0,
              right: 0,
              child: IgnorePointer(
                ignoring: distance != 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: widget.height,
                      child: HomeHotelCard(
                        hotel: widget.hotels[index],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).reversed.toList(),
        ),
      ),
    );
  }
}