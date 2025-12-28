import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 1.obs;
  final previousIndex = 1.obs;

  final isSearchExpanded = false.obs;

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final tabs = ['Motel', 'Hotel', 'Apartment', 'Villa'];
  String get currentTab => tabs[selectedIndex.value];

  void select(int index) {
    if (index == selectedIndex.value) return;
    previousIndex.value = selectedIndex.value;
    selectedIndex.value = index;
    HapticFeedback.selectionClick();
  }

  void openSearch() {
    HapticFeedback.lightImpact();
    isSearchExpanded.value = true;

    Future.delayed(const Duration(milliseconds: 100), () {
      searchFocusNode.requestFocus();
    });
  }

  void closeSearch() {
    if (!isSearchExpanded.value) return;

    HapticFeedback.lightImpact();
    isSearchExpanded.value = false;
    searchController.clear();
    searchFocusNode.unfocus();
  }

  @override
  void onInit() {
    super.onInit();

    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus && isSearchExpanded.value) {
        closeSearch();
      }
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.onClose();
  }
}
