import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/complaint.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/complaint_repo.dart';

class ComplaintsController extends GetxController {
  ComplaintRepo complaintRepo = ComplaintRepo();
  List<Complaint> complaints = [];
  var isLoadingComplaints = false.obs;

  Future<void> getComplaints() async {
    isLoadingComplaints.value = true;
    complaints = await complaintRepo.getComplaints();
    isLoadingComplaints.value = false;
  }
}
