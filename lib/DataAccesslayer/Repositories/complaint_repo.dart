import 'dart:convert';

import 'package:one_restaurant_delivery/DataAccesslayer/Models/complaint.dart';

import '../Clients/complaint_client.dart';

class ComplaintRepo {
  ComplaintClient client = ComplaintClient();

  Future<List<Complaint>> getComplaints() async {
    var response = await client.getComplaints();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Complaint>((json) => Complaint.fromMap(json)).toList();
    }
    return [];
  }

  Future<Complaint?> createComplaint(complaintDescription) async {
    var response = await client.createComplaint(complaintDescription);
    if (response != "") {
      final parsed = json.decode(response);
      return Complaint.fromMap(parsed);
    }
    return null;
  }
}
