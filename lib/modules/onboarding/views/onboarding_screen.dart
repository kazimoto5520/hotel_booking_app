import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/core/routes/app_routes.dart';
import 'package:hotel_booking_app/core/ui/app_step_button.dart';
import 'package:hotel_booking_app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:hotel_booking_app/modules/onboarding/widgets/onboarding_image_grid.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingContent = [
    {
      "title": "Track your mood and reflect on your day",
      "desc":
          "Get an overview of how you are performing and motivate yourself to achieve more.",
    },
    {
      "title": "Understand your habits",
      "desc":
          "Discover patterns and gain insights into your daily emotional health.",
    },
    {
      "title": "Build a better you",
      "desc": "Use insights to grow, improve, and stay mentally balanced.",
    },
  ];

  final List<List<String>> onboardingImages = [
    [
      "assets/images/onboarding/hotel1.jpg",
      "assets/images/onboarding/hotel2.jpg",
      "assets/images/onboarding/hotel3.jpg",
      "assets/images/onboarding/hotel4.jpg",
    ],
    [
      "assets/images/onboarding/hotel4.jpg",
      "assets/images/onboarding/hotel3.jpg",
      "assets/images/onboarding/hotel2.jpg",
      "assets/images/onboarding/hotel1.jpg",
    ],
    [
      "assets/images/onboarding/hotel1.jpg",
      "assets/images/onboarding/hotel2.jpg",
      "assets/images/onboarding/hotel3.jpg",
      "assets/images/onboarding/hotel4.jpg",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final step = controller.currentStep.value;
            final content = onboardingContent[step];

            return Column(
              children: [
                const SizedBox(height: 24),
                OnboardingImageGrid(
                  images: onboardingImages[step],
                ),
                const SizedBox(height: 60),
                _showTitleDescription(
                  context,
                  title: content["title"]!,
                  description: content["desc"]!,
                ),
                const Spacer(),
                if (controller.canGoBack)
                  TextButton(
                    onPressed: controller.prev,
                    child: const Text("Back"),
                  ),
                const SizedBox(height: 12),
                AppStepButton(
                  onTap: () {
                    if (controller.isLastStep) {
                      Get.offAllNamed(AppRoutes.signIn);
                    } else {
                      controller.next();
                    }
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

Widget _showTitleDescription(
  BuildContext context, {
  required String title,
  required String description,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 8),
      Text(
        description,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
