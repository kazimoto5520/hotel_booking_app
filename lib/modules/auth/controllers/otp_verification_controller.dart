import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/core/routes/app_routes.dart';

enum OtpStatus { idle, verifying, success, error }

class OtpVerificationController extends GetxController {
  final otpController = TextEditingController();

  final status = OtpStatus.idle.obs;

  bool get isLoading => status.value == OtpStatus.verifying;
  bool get isSuccess => status.value == OtpStatus.success;
  bool get isError => status.value == OtpStatus.error;

  Future<void> verifyOtp(String otp) async {
    status.value = OtpStatus.verifying;

    // simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (otp == "000000") {
      status.value = OtpStatus.success;
      Get.offAllNamed(AppRoutes.home);
    } else {
      status.value = OtpStatus.error;
    }
  }

  void resendOtp() {
    otpController.clear();
    status.value = OtpStatus.idle;
    debugPrint("Resend OTP");
  }

  void reset() {
    otpController.clear();
    status.value = OtpStatus.idle;
  }
}