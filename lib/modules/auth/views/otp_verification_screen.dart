import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/core/ui/app_pin_code_field.dart';
import 'package:hotel_booking_app/modules/auth/controllers/otp_verification_controller.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final OtpVerificationController controller =
      Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              _showLogoAndHeadings(context),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              AppPinCodeField(
                length: 6,
                controller: controller.otpController,
                onCompleted: (code) {
                  // verify OTP
                  print("OTP entered: $code");
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _showLogoAndHeadings(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/hotel_logo.png",
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 24),
        Text(
          "One time password",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "Please enter the one time password sent to your email address",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
