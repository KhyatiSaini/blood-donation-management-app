import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import '../models/donor.dart';
import '../utilities/constants.dart';
import '../utilities/displayToast.dart';

class DonorProvider extends ChangeNotifier {
  List<Donor> donors = [];
  bool isListFetched = false;

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
      }
      else {
        displayToast("Some error occurred");
      }
    } catch (e) {
      throw e;
    }
  }
}