import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;

  final bool showBack;
  final VoidCallback? onBack;

  final List<Widget>? actions;

  final bool centerTitle;
  final bool transparent;
  final double elevation;

  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.showBack = false,
    this.onBack,
    this.actions,
    this.centerTitle = true,
    this.transparent = false,
    this.elevation = 0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = transparent
        ? Colors.transparent
        : backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;

    return AppBar(
      backgroundColor: bgColor,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,

      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            )
          : null,

      title: titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                )
              : null),

      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
