import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppPinCodeField extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool enabled;
  final String? errorText;
  final FocusNode? focusNode;

  const AppPinCodeField({
    super.key,
    required this.controller,
    required this.onCompleted,
    this.onChanged,
    this.length = 4,
    this.obscureText = false,
    this.enabled = true,
    this.errorText,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PinCodeTextField(
          appContext: context,
          length: length,
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          autoFocus: true,
          obscureText: obscureText,
          obscuringCharacter: '●',
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          cursorColor: AppColors.primary,
          textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),

          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(14),
            fieldHeight: 56,
            fieldWidth: 52,
            activeColor: AppColors.primary,
            selectedColor: AppColors.primary,
            inactiveColor:
                hasError ? AppColors.error : AppColors.border,
            activeFillColor: Colors.white,
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            errorBorderColor: AppColors.error,
          ),

          enableActiveFill: true,
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: Colors.transparent,
          enablePinAutofill: true,

          onCompleted: onCompleted,
          onChanged: onChanged ?? (_) {},
        ),

        if (hasError) ...[
          const SizedBox(height: 8),
          Text(
            errorText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.error,
                ),
          ),
        ],
      ],
    );
  }
}
