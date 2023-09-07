import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/orders_controllers.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Orders/order_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

import '../Widgets/Public/ord_drawer.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final ordersController = Get.find<OrdersController>();

  Widget buildOrdersList(orders) {
    return orders.isEmpty
        ? const Center(
            child: Text(
              'لا يوجد طلبات ',
              style: UITextStyle.medium,
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return OrderBox(
                order: orders[index],
              );
            },
            separatorBuilder: (context, index) => spacerHeight(),
            itemCount: orders.length,
          );
  }

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
              const PageTitle(title: 'الطلبات'),
              spacerHeight(),
              Expanded(
                child: Obx(
                  () {
                    return RefreshIndicator(
                      onRefresh: () => ordersController.getOrders(),
                      child: ordersController.isLoadingOrders.value
                          ? Center(
                              child: loadingItem(width: 100, isWhite: true))
                          : buildOrdersList(ordersController.orders),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
