import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';

class AppPinCodeField extends StatefulWidget {
  final TextEditingController controller;
  final int length;
  final ValueChanged<String> onCompleted;
  final VoidCallback? onResend;
  final int resendAfterSeconds;
  final bool obscureText;
  final String? errorText;
  final bool enableHaptics;
  final bool enablePaste;
  final bool enabled;
  final bool loading;
  final bool success;

  const AppPinCodeField({
    super.key,
    required this.controller,
    required this.onCompleted,
    this.onResend,
    this.length = 6,
    this.resendAfterSeconds = 30,
    this.obscureText = false,
    this.errorText,
    this.enableHaptics = true,
    this.enablePaste = true,
    this.enabled = true,
    this.loading = false,
    this.success = false,
  });

  @override
  State<AppPinCodeField> createState() => _AppPinCodeFieldState();
}

class _AppPinCodeFieldState extends State<AppPinCodeField>
    with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  Timer? _timer;
  int _secondsLeft = 0;

  @override
  void initState() {
    super.initState();

    _setupShakeAnimation();
    _startResendTimer();

    if (widget.enablePaste) {
      _tryPasteFromClipboard();
    }
  }

  void _setupShakeAnimation() {
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 0), weight: 1),
    ]).animate(_shakeController);
  }

  void _startResendTimer() {
    if (widget.onResend == null) return;

    _secondsLeft = widget.resendAfterSeconds;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  Future<void> _tryPasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim() ?? "";

    if (text.length == widget.length && RegExp(r'^\d+$').hasMatch(text)) {
      widget.controller.text = text;
      widget.onCompleted(text);
    }
  }

  @override
  void didUpdateWidget(covariant AppPinCodeField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.errorText != null && widget.errorText!.isNotEmpty) {
      _shakeController.forward(from: 0);

      if (widget.enableHaptics) {
        HapticFeedback.mediumImpact();
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _shakeAnimation,
          builder: (_, child) {
            return Transform.translate(
              offset: Offset(_shakeAnimation.value, 0),
              child: child,
            );
          },
          child: Stack(
            children: [
              PinCodeTextField(
                appContext: context,
                length: widget.length,
                controller: widget.controller,
                enabled: widget.enabled && !widget.loading && !widget.success,
                autoFocus: true,
                obscureText: widget.obscureText,
                obscuringCharacter: '●',
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                cursorColor: AppColors.primary,
                enablePinAutofill: true,
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                backgroundColor: Colors.transparent,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(14),
                  fieldHeight: 56,
                  fieldWidth: 52,
                  activeColor:
                      widget.success ? Colors.green : AppColors.primary,
                  selectedColor:
                      widget.success ? Colors.green : AppColors.primary,
                  inactiveColor: widget.success
                      ? Colors.green
                      : (hasError ? AppColors.error : AppColors.border),
                  activeFillColor: Theme.of(context).colorScheme.surface,
                  selectedFillColor: Theme.of(context).colorScheme.surface,
                  inactiveFillColor: Theme.of(context).colorScheme.surface,
                ),
                enableActiveFill: true,
                onChanged: (_) {},
                onCompleted: (value) {
                  if (widget.loading || widget.success) return;

                  if (widget.enableHaptics) {
                    HapticFeedback.lightImpact();
                  }

                  widget.onCompleted(value);
                },
              ),
              if (widget.loading || widget.success)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: widget.loading
                          ? const CircularProgressIndicator()
                          : const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 56,
                            ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          Text(
            widget.errorText!,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.error),
          ),
        ],
        const SizedBox(height: 16),
        if (widget.onResend != null)
          TextButton(
            onPressed: _secondsLeft == 0
                ? () {
                    widget.onResend?.call();
                    _startResendTimer();
                  }
                : null,
            child: Text(
              _secondsLeft == 0 ? "Resend code" : "Resend in $_secondsLeft s",
            ),
          ),
      ],
    );
  }
}

