import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';
import 'package:hotel_booking_app/core/theme/app_text_styles.dart';

enum AppButtonVariant { primary, secondary, outline, danger }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool fullWidth;
  final AppButtonVariant variant;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.fullWidth = true,
    this.variant = AppButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bool disabled = onPressed == null || loading;

    final Color backgroundColor;
    final Color borderColor;
    final Color textColor;

    switch (variant) {
      case AppButtonVariant.secondary:
        backgroundColor = AppColors.secondary;
        borderColor = AppColors.secondary;
        textColor = Colors.white;
        break;

      case AppButtonVariant.outline:
        backgroundColor = Colors.transparent;
        borderColor = AppColors.primary;
        textColor = AppColors.primary;
        break;

      case AppButtonVariant.danger:
        backgroundColor = AppColors.error;
        borderColor = AppColors.error;
        textColor = Colors.white;
        break;

      default:
        backgroundColor = AppColors.primary;
        borderColor = AppColors.primary;
        textColor = Colors.white;
    }

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 52,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: variant == AppButtonVariant.outline ? 0 : 1,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: loading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: textColor,
                ),
              )
            : Text(
                label,
                style: AppTextStyles.button.copyWith(color: textColor),
              ),
      ),
    );
  }
}
