import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';
import 'package:hotel_booking_app/modules/home/controllers/home_controller.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:get/get.dart';

class HomeSearchTabs extends StatelessWidget {
  HomeSearchTabs({super.key});

  final HomeController controller = Get.find<HomeController>();

  final List<String> tabs = const [
    'Motel',
    'Hotel',
    'Apartment',
    'Villa',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
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
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: controller.isSearchExpanded.value
                  ? const SizedBox.shrink()
                  : _tabs(context),
            ),
          ),
        ],
      );
    });
  }

  Widget _searchExpandable(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      width: controller.isSearchExpanded.value ? 260 : 44,
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
        onTap: () => controller.toggleSearch(true),
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
          onTap: () => controller.toggleSearch(false),
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
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
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
    );
  }
}
