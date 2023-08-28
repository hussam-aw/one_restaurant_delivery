import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/complaints_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/complaint.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/complaint_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';

class ComplaintController extends GetxController {
  TextEditingController complaintDescriptionController =
      TextEditingController();
  ComplaintRepo complaintRepo = ComplaintRepo();
  final complainsController = Get.find<ComplaintsController>();
  final loading = false.obs;

  Future<void> createCpmplaint() async {
    String complaintDescription = complaintDescriptionController.text;
    if (complaintDescription.isNotEmpty) {
      loading.value = true;
      Complaint? complaint =
          await complaintRepo.createComplaint(complaintDescription);
      loading.value = false;
      if (complaint != null) {
        complainsController.getComplaints();
        Get.back();
        SnackBars.showSuccess('تم ارسال الشكوى');
      } else {
        SnackBars.showError('حدث خطأ أثناء الارسال');
      }
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة');
    }
  }
}
