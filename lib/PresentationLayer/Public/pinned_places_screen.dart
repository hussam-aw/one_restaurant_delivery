import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/places_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Places/add_location_bottom_sheet.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Places/place_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/add_floating_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class PinnedPlacesScreen extends StatelessWidget {
  PinnedPlacesScreen({super.key});

  final placesController = Get.find<PlacesController>();
  final String? screenMode = Get.arguments;

  Widget buildPlacesList(places) {
    return places.isEmpty
        ? const Center(
            child: Text(
              'لا يوجد أماكن مثبتة ',
              style: UITextStyle.medium,
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return PlaceBox(
                place: places[index],
                selectionMode: screenMode != null ? true : false,
                onTap: screenMode != null
                    ? () {
                        Get.back(result: places[index]);
                      }
                    : null,
              );
            },
            separatorBuilder: (context, index) => spacerHeight(),
            itemCount: places.length,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: OrdDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              const PageTitle(title: 'الأماكن المثبتة'),
              spacerHeight(),
              Expanded(
                child: Obx(
                  () {
                    return placesController.isLoadingPinnedPlaces.value
                        ? Center(child: loadingItem(width: 100, isWhite: true))
                        : buildPlacesList(placesController.pinnedPlaces);
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: screenMode != null
            ? null
            : AddFloatingButton(
                onPressed: () {
                  Get.bottomSheet(AddCurrentLocationBottomSheet());
                },
              ),
      ),
    );
  }
}
