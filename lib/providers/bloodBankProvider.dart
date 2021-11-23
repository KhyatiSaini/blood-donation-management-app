import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import '../models/bloodBank.dart';
import '../utilities/constants.dart';
import '../utilities/displayToast.dart';

class BloodBankProvider extends ChangeNotifier {
  List<BloodBank> bloodBanks = [];
  bool isListFetched = false;

  Future fetchBloodBanks() async {
    List<BloodBank> list = [];
    try {
      final response = await get(Uri.parse('${api}bloodBanks'),
          headers: {
            "Accept": "application/json",
            "Access-Control_Allow_Origin": "*",
          }
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final length = data.length;
        for (int i = 0; i < length; i++) {
          BloodBank bloodBank = BloodBank.fromJson(data[i]);
          list.add(bloodBank);
        }
        bloodBanks = list;
        isListFetched = true;
        notifyListeners();
      }
    } catch (e) {
      throw e;
    }
  }

  Future createBloodBank(Map<dynamic, dynamic> bloodBank) async {
    try {
      final response = await post(
        Uri.parse('${api}bloodBanks'),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
        },
        body: jsonEncode(bloodBank),
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