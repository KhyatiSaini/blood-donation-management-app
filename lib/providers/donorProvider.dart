import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import '../models/donor.dart';
import '../utilities/constants.dart';
import '../utilities/displayToast.dart';

class DonorProvider extends ChangeNotifier {
  List<Donor> donors = [];
  bool isListFetched = false;

  /// function to fetch all the donors record form the database
  Future fetchDonors() async {
    List<Donor> list = [];
    try {
      final response = await get(Uri.parse('${api}donors'),
          headers: {
            "Accept": "application/json",
            "Access-Control_Allow_Origin": "*",
          }
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final length = data.length;
        for (int i = 0; i < length; i++) {
          Donor donor = Donor.fromJson(data[i]);
          list.add(donor);
        }
        donors = list;
        isListFetched = true;
        notifyListeners();
      }
    } catch (e) {
      throw e;
    }
  }

  /// function to create a new donor in the database
  Future createDonor(Map<dynamic, dynamic> donor) async {
    try {
      final response = await post(
        Uri.parse('${api}donors'),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
        },
        body: jsonEncode(donor),
      );

      if (response.statusCode == 200) {
        displayToast("Data inserted successfully");
        // call the fetch function to fetch the updated donors records after adding one more donor
        fetchDonors();
      }
      else {
        displayToast("Some error occurred");
      }
    } catch (e) {
      throw e;
    }
  }

  /// function to update the donor's [latest_donation_date]
  Future updateDonorRecordById(String id, String date) async {
    try {
      final response = await put(
        Uri.parse('${api}donors/$id'),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
        },
        body: jsonEncode({'date': date}),
      );

      if (response.statusCode == 200) {
        displayToast("Data updated successfully");
        // call the fetch function to fetch the updated donors records after updating the donor record
        fetchDonors();
      }
      else {
        displayToast("Some error occurred");
      }
    } catch (e) {
      throw e;
    }
  }
}