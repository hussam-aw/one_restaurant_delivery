import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/places_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: const OrdDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              const PageTitle(title: 'الأماكن المثبتة'),
              spacerHeight(),
              Expanded(
                child: Obx(() {
                  return placesController.isLoadingPinnedPlaces.value
                      ? Center(child: loadingItem(width: 100, isWhite: true))
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return PlaceBox(
                              place: placesController.pinnedPlaces[index],
                            );
                          },
                          separatorBuilder: (context, index) => spacerHeight(),
                          itemCount: placesController.pinnedPlaces.length,
                        );
                }),
              )
            ],
          ),
        ),
        floatingActionButton: AddFloatingButton(
          onPressed: () {
            Get.bottomSheet(AddCurrentLocationBottomSheet());
          },
        ),
      ),
    );
  }
}
