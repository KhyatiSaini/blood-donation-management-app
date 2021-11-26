import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';

import '../models/patient.dart';
import '../utilities/constants.dart';
import '../utilities/displayToast.dart';

class PatientProvider extends ChangeNotifier {
  List<Patient> patients = [];
  bool isListFetched = false;

  /// function to fetch all the patients record from the database
  Future fetchPatients() async {
    List<Patient> list = [];
    try {
      final response = await get(
        Uri.parse('${api}patients'),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
        },
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

  /// function to create a new patient in the database
  Future createPatient(Map<dynamic, dynamic> patient) async {
    try {
      final response = await post(
        Uri.parse('${api}patients'),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
        },
        body: jsonEncode(patient),
      );

      if (response.statusCode == 200) {
        displayToast("Data inserted successfully");
        // call the fetch function to fetch the updated patient records after adding one more patient
        fetchPatients();
      }
      else {
        displayToast("Some error occurred");
      }
    } catch (e) {
      throw e;
    }
  }
}
