import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/orders_controllers.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Orders/order_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

import '../Widgets/Public/ord_drawer.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final ordersController = Get.find<OrdersController>();

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
                child: GetBuilder(
                    init: ordersController,
                    builder: (_) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return OrderBox(
                            order: ordersController.orders[index],
                          );
                        },
                        separatorBuilder: (context, index) => spacerHeight(),
                        itemCount: ordersController.orders.length,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
