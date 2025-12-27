import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';
import 'package:hotel_booking_app/core/ui/app_button.dart';
import 'package:hotel_booking_app/core/ui/app_text_field.dart';
import 'package:hotel_booking_app/modules/auth/controllers/authentication_controller.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  final AuthenticationController controller =
      Get.put(AuthenticationController());

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
                _showGoogleSignInButton(context),
                const SizedBox(height: 24),
                _showDivider(context),
                const SizedBox(height: 24),
                _showAuthForm(context),
              ],
            ),
          ),
        ),
      ),
    );
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
          "Welcome back to Hotel Booking App",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "Sign in to continue",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _showGoogleSignInButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: () {
            controller.signInWithGoogle();
          },
          borderRadius: BorderRadius.circular(14),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.border,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icons/google.png",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 12),
                const Text(
                  "Continue with Google",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColors.border,
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "or continue with email",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
              letterSpacing: 0.3,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.border,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showAuthForm(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: TextEditingController(),
          label: "Email address",
          hint: "Enter your email address",
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.email_outlined,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        AppButton(
          label: "Continue",
          onPressed: () {},
        ),
      ],
    );
  }
}
