import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/complaints_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/complaint.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Complaints/complaint_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Complaints/send_complaint_bottom_sheet.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/add_floating_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class ComplaintsScreen extends StatelessWidget {
  ComplaintsScreen({super.key});

  final complaintsController = Get.find<ComplaintsController>();

  Widget buildComplaintsList(List<Complaint> complaints) {
    return complaints.isEmpty
        ? const Center(
            child: Text(
              'لا يوجد شكاوى',
              style: UITextStyle.medium,
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return ComplaintBox(
                complaint: complaints[index],
              );
            },
            separatorBuilder: (context, index) => spacerHeight(),
            itemCount: complaints.length,
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
              const PageTitle(title: 'الشكاوى والمقترحات'),
              spacerHeight(height: 22),
              Expanded(
                child: Obx(() {
                  return complaintsController.isLoadingComplaints.value
                      ? Center(child: loadingItem(width: 100, isWhite: true))
                      : buildComplaintsList(complaintsController.complaints);
                }),
              )
            ],
          ),
        ),
        floatingActionButton: AddFloatingButton(
          onPressed: () {
            Get.bottomSheet(SendComplaintBottomSheet());
          },
        ),
      ),
    );
  }
}
