import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';
import 'package:hotel_booking_app/modules/home/controllers/home_controller.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:get/get.dart';

class HomeSearchTabs extends StatelessWidget {
  const HomeSearchTabs({super.key, required this.controller});

  final HomeController controller;
  final Curve _appleBounce = const Cubic(0.34, 1.56, 0.64, 1);

  final List<String> tabs = const [
    'Motel',
    'Hotel',
    'Apartment',
    'Villa',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap:
            controller.isSearchExpanded.value ? controller.closeSearch : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _searchExpandable(context),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: controller.isSearchExpanded.value ? 0 : 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _showDivider(),
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: controller.isSearchExpanded.value
                    ? const SizedBox.shrink()
                    : _tabs(context),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _searchExpandable(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
      width: controller.isSearchExpanded.value ? screenWidth - 32 : 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: controller.isSearchExpanded.value
          ? _searchInput(context)
          : _searchIcon(),
    );
  }

  Widget _searchIcon() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: controller.openSearch,
        child: const Center(
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            size: 22,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _searchInput(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        const HugeIcon(
          icon: HugeIcons.strokeRoundedSearch01,
          size: 20,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: controller.searchController,
            focusNode: controller.searchFocusNode,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Search hotel, city…',
              border: InputBorder.none,
              isDense: true,
            ),
            onChanged: (value) {
              // TODO: trigger search
            },
          ),
        ),
        InkWell(
          onTap: controller.closeSearch,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.close, size: 18),
          ),
        ),
      ],
    );
  }

  Widget _showDivider() {
    return Container(
      width: 1,
      height: 28,
      color: AppColors.border.withOpacity(0.6),
    );
  }

  Widget _tabs(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Obx(() {
            final isActive = controller.selectedIndex.value == index;
            return _tabItem(
              label: tabs[index],
              isActive: isActive,
              index: index,
              onTap: () => controller.select(index),
              context: context,
            );
          });
        },
      ),
    );
  }

  Widget _tabItem({
    required String label,
    required bool isActive,
    required int index,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    final bool movingRight = index > controller.previousIndex.value;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 160),
        curve: _appleBounce,
        offset: isActive ? Offset.zero : Offset(movingRight ? 0.12 : -0.12, 0),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 140),
          scale: isActive ? 1.0 : 0.96,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: isActive ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : AppColors.textSecondary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
