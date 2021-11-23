import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import '../models/patient.dart';
import '../utilities/constants.dart';

class PatientProvider extends ChangeNotifier {
  List<Patient> patients = [];
  bool isListFetched = false;

  Future fetchPatients() async {
    List<Patient> list = [];
    try {
      final response = await get(Uri.parse('${api}patients'),
          headers: {
            "Accept": "application/json",
            "Access-Control_Allow_Origin": "*",
          }
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final length = data.length;
        for (int i = 0; i < length; i++) {
          Patient patient = Patient.fromJson(data[i]);
          list.add(patient);
        }
        patients = list;
        isListFetched = true;
        notifyListeners();
      }
    } catch (e) {
      throw e;
    }
  }
}