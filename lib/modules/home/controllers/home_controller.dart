import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/data/local/home_hotel_model.dart';

class HomeController extends GetxController {
  final selectedIndex = 1.obs;
  final previousIndex = 1.obs;

  final isSearchExpanded = false.obs;
  final isLoading = false.obs;

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final tabs = ['Motel', 'Hotel', 'Apartment', 'Villa'];
  String get currentTab => tabs[selectedIndex.value];

  final Map<String, List<HomeHotelModel>> hotelsByTab = {
    'Hotel': [
      HomeHotelModel(
        name: 'Asban Hotel',
        location: 'Lubin, Poland',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$550 / Night',
      ),
      HomeHotelModel(
        name: 'Luxury Resort',
        location: 'Paris, France',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$420 / Night',
      ),
    ],
    'Motel': [
      HomeHotelModel(
        name: 'Xanadu Luxury Villa & Retreat Zanzibar',
        location: 'Zanzibar, Tanzania',
        image: 'assets/images/onboarding/hotel4.jpg',
        price: '\$420 / Night',
      ),
    ],
    'Apartment': [],
    'Villa': [],
  };

  List<HomeHotelModel> get currentHotels => hotelsByTab[currentTab] ?? [];

  void select(int index) async {
    if (index == selectedIndex.value) return;
    previousIndex.value = selectedIndex.value;
    selectedIndex.value = index;

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    isLoading.value = false;
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
