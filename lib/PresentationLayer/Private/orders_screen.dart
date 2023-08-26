import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Order/order_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

import '../Widgets/Public/ord_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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
                  child: ListView.separated(
                itemBuilder: (context, index) {
                  return const OrderBox();
                },
                separatorBuilder: (context, index) => spacerHeight(),
                itemCount: 5,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
