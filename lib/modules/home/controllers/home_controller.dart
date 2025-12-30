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
        name: 'Asban Grand Hotel',
        location: 'Lubin, Poland',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$550 / Night',
      ),
      HomeHotelModel(
        name: 'Elysium Luxury Resort & Spa',
        location: 'Paris, France',
        image: 'assets/images/onboarding/hotel2.jpg',
        price: '\$720 / Night',
      ),
      HomeHotelModel(
        name: 'The Royal Palm Executive Suites',
        location: 'Dubai, UAE',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$890 / Night',
      ),
      HomeHotelModel(
        name: 'Nordic Harbor Boutique Hotel',
        location: 'Stockholm, Sweden',
        image: 'assets/images/onboarding/hotel4.jpg',
        price: '\$480 / Night',
      ),
    ],
    'Motel': [
      HomeHotelModel(
        name: 'Xanadu Luxury Villa & Retreat Zanzibar',
        location: 'Zanzibar, Tanzania',
        image: 'assets/images/onboarding/hotel4.jpg',
        price: '\$420 / Night',
      ),
      HomeHotelModel(
        name: 'Sunset Drive Oceanfront Motel',
        location: 'Malibu, California',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$310 / Night',
      ),
      HomeHotelModel(
        name: 'Desert Rose Highway Motel',
        location: 'Nevada, USA',
        image: 'assets/images/onboarding/hotel2.jpg',
        price: '\$180 / Night',
      ),
    ],
    'Apartment': [
      HomeHotelModel(
        name: 'Skyline Executive Apartments',
        location: 'New York City, USA',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$260 / Night',
      ),
      HomeHotelModel(
        name: 'Modern Cityview Apartment Loft',
        location: 'Berlin, Germany',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$220 / Night',
      ),
      HomeHotelModel(
        name: 'Riverside Minimalist Studio',
        location: 'Amsterdam, Netherlands',
        image: 'assets/images/onboarding/hotel2.jpg',
        price: '\$240 / Night',
      ),
    ],
    'Villa': [
      HomeHotelModel(
        name: 'Azure Cliff Private Villa',
        location: 'Santorini, Greece',
        image: 'assets/images/onboarding/hotel4.jpg',
        price: '\$1,200 / Night',
      ),
      HomeHotelModel(
        name: 'Palm Horizon Beachfront Villa',
        location: 'Bali, Indonesia',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$980 / Night',
      ),
      HomeHotelModel(
        name: 'Serenity Hills Luxury Estate',
        location: 'Cape Town, South Africa',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$1,050 / Night',
      ),
    ],
  };

  final Map<String, List<HomeHotelModel>> nearbyHotelsByTab = {
    'Hotel': [
      HomeHotelModel(
        name: 'City Center Hotel',
        location: '2.5 km away',
        image: 'assets/images/onboarding/hotel2.jpg',
        price: '\$280 / Night',
      ),
      HomeHotelModel(
        name: 'Downtown Suites',
        location: '3.1 km away',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$320 / Night',
      ),
      HomeHotelModel(
        name: 'Metro Plaza Hotel',
        location: '4.2 km away',
        image: 'assets/images/onboarding/hotel4.jpg',
        price: '\$295 / Night',
      ),
      HomeHotelModel(
        name: 'Urban Comfort Inn',
        location: '5.0 km away',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$265 / Night',
      ),
    ],
    'Motel': [
      HomeHotelModel(
        name: 'Roadside Motel',
        location: '1.8 km away',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$150 / Night',
      ),
      HomeHotelModel(
        name: 'Highway Rest Motel',
        location: '3.5 km away',
        image: 'assets/images/onboarding/hotel2.jpg',
        price: '\$130 / Night',
      ),
      HomeHotelModel(
        name: 'Transit Lodge',
        location: '4.7 km away',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$145 / Night',
      ),
    ],
    'Apartment': [
      HomeHotelModel(
        name: 'Urban Studio',
        location: '2.0 km away',
        image: 'assets/images/onboarding/hotel4.jpg',
        price: '\$180 / Night',
      ),
      HomeHotelModel(
        name: 'City Loft',
        location: '2.8 km away',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$195 / Night',
      ),
      HomeHotelModel(
        name: 'Metro Apartment',
        location: '3.3 km away',
        image: 'assets/images/onboarding/hotel2.jpg',
        price: '\$210 / Night',
      ),
      HomeHotelModel(
        name: 'Downtown Flat',
        location: '4.1 km away',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$175 / Night',
      ),
    ],
    'Villa': [
      HomeHotelModel(
        name: 'Coastal Villa',
        location: '6.2 km away',
        image: 'assets/images/onboarding/hotel3.jpg',
        price: '\$650 / Night',
      ),
      HomeHotelModel(
        name: 'Garden Estate',
        location: '7.5 km away',
        image: 'assets/images/onboarding/hotel4.jpg',
        price: '\$720 / Night',
      ),
      HomeHotelModel(
        name: 'Hillside Villa',
        location: '8.0 km away',
        image: 'assets/images/onboarding/hotel1.jpg',
        price: '\$680 / Night',
      ),
    ],
  };

  List<HomeHotelModel> get currentHotels => hotelsByTab[currentTab] ?? [];
  List<HomeHotelModel> get currentNearbyHotels => nearbyHotelsByTab[currentTab] ?? [];

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