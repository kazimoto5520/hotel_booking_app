import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
        children: [
          const TextSpan(text: 'Find Best '),
          const TextSpan(
              text: 'Hotel\n',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              )),
          const TextSpan(text: 'With '),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 4,
                  left: -4,
                  right: -4,
                  child: Transform.rotate(
                    angle: -0.04,
                    child: Container(
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade400,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Best Price',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
