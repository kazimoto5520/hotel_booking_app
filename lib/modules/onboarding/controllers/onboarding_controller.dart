import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final currentStep = 0.obs;
  final totalSteps = 3;

  void next() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    }
  }

  void prev() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  bool get canGoBack => currentStep.value > 0;
  bool get isLastStep => currentStep.value == totalSteps - 1;
}
