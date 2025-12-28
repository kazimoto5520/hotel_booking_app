import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 1.obs;
  final isSearchExpanded = false.obs;

  final searchController = TextEditingController();

  void select(int index) {
    HapticFeedback.selectionClick();
    selectedIndex.value = index;
  }

  void toggleSearch([bool? value]) {
    HapticFeedback.lightImpact();
    isSearchExpanded.value = value ?? !isSearchExpanded.value;

    if (!isSearchExpanded.value) {
      searchController.clear();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}