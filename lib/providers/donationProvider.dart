import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import '../models/donation.dart';
import '../utilities/constants.dart';
import '../utilities/displayToast.dart';

class DonationProvider extends ChangeNotifier {
  List<Donation> donations = [];
  bool isListFetched = false;

  Future fetchDonations() async {
    List<Donation> list = [];
    try {
      final response = await get(
        Uri.parse('${api}donations'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final length = data.length;
        for (int i = 0; i < length; i++) {
          Donation donation = Donation.fromJson(data[i]);
          list.add(donation);
        }
        donations = list;
        isListFetched = true;
        notifyListeners();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<bool> createDonation(Map<dynamic, dynamic> donation) async {
    try {
      final response = await post(
        Uri.parse('${api}donations'),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
        },
        body: jsonEncode(donation),
      );

      if (response.statusCode == 200) {
        displayToast("Data inserted successfully");
        fetchDonations();
        return true;
      }
      else {
        displayToast("Some error occurred");
      }
      return false;
    } catch (e) {
      throw e;
    }
  }
}
