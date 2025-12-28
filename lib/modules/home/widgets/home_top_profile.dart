import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeTopProfile extends StatelessWidget {
  const HomeTopProfile({super.key});

  static const double _size = 44;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _circleAction(
          icon: HugeIcons.strokeRoundedMenu05,
          onTap: () {
            // TODO: open drawer / menu
          },
        ),
        _avatarAction(
          imagePath: "assets/images/profile.jpg",
          onTap: () {
            // TODO: open profile
          },
        ),
      ],
    );
  }

  Widget _circleAction({
    required List<List<dynamic>> icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.surface,
      shape: const CircleBorder(),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: _size,
          height: _size,
          child: Center(
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedMenu02,
              size: 22,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatarAction({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Material(
      shape: const CircleBorder(),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: _size,
          height: _size,
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
