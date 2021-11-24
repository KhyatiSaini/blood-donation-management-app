import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../../models/donor.dart';
import '../../../models/patient.dart';
import '../../../models/donation.dart';
import '../../../models/bloodBank.dart';
import '../../../utilities/dateUtil.dart';
import '../../../utilities/displayToast.dart';
import '../../../providers/donorProvider.dart';
import '../../../providers/patientProvider.dart';
import '../../../providers/donationProvider.dart';
import '../../../providers/bloodBankProvider.dart';

class AddRecordWidget extends StatefulWidget {
  @override
  State<AddRecordWidget> createState() => _AddRecordWidgetState();
}

class _AddRecordWidgetState extends State<AddRecordWidget> {
  late String donorId, patientId, bloodBankName;

  @override
  void initState() {
    donorId = "";
    patientId = "";
    bloodBankName = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade700,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 1200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer<DonorProvider>(
                  builder: (context, provider, child) {
                    provider.fetchDonors();
                    final bool isListFetched = provider.isListFetched;
                    final List<String> donorIds = [];
                    if (isListFetched) {
                      final List<Donor> donors = provider.donors;
                      for (int i = 0; i < donors.length; i++) {
                        if (donors[i].latestDonationDate != null && formatDate(donors[i].latestDonationDate!).difference(DateTime.now()).inDays >= 90) {
                          donorIds.add(donors[i].id.toString());
                        }
                        else if (donors[i].latestDonationDate == null) {
                          donorIds.add(donors[i].id.toString());
                        }
                      }
                    }

                    return DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: donorIds,
                      onChanged: (selectedId) {
                        donorId = selectedId!;
                      },
                      dropdownSearchDecoration: InputDecoration(
                        hintText: 'donor id'.toUpperCase(),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(width: 15),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer<PatientProvider>(
                  builder: (context, provider, child) {
                    provider.fetchPatients();
                    final bool isListFetched = provider.isListFetched;
                    final List<String> patientIds = [];
                    if (isListFetched) {
                      final List<Patient> patients = provider.patients;
                      for (int i = 0; i < patients.length; i++) {
                        patientIds.add(patients[i].id.toString());
                      }
                    }

                    return DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: patientIds,
                      onChanged: (selectedId) {
                        patientId = selectedId!;
                      },
                      dropdownSearchDecoration: InputDecoration(
                        hintText: 'Patient id'.toUpperCase(),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(width: 15),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer<BloodBankProvider>(
                  builder: (context, provider, child) {
                    provider.fetchBloodBanks();
                    final bool isListFetched = provider.isListFetched;
                    final List<String> bloodBankNames = [];
                    if (isListFetched) {
                      final List<BloodBank> bloodBank = provider.bloodBanks;
                      for (int i = 0; i < bloodBank.length; i++) {
                        bloodBankNames.add(bloodBank[i].name);
                      }
                    }

                    return DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: bloodBankNames,
                      onChanged: (selectedId) {
                        bloodBankName = selectedId!;
                      },
                      dropdownSearchDecoration: InputDecoration(
                        hintText: 'Blood bank'.toUpperCase(),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(width: 50),
              Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(
                  onPressed: () async {
                    if (donorId.isNotEmpty && patientId.isNotEmpty && bloodBankName.isNotEmpty) {
                      DateTime date = DateTime.now().toUtc();
                      Donation donation = Donation(int.parse(donorId), int.parse(patientId), bloodBankName, date.toString().substring(0, 10));
                      final donationProvider = Provider.of<DonationProvider>(context, listen: false);
                      final donorProvider = Provider.of<DonorProvider>(context, listen: false);

                      bool result = await donationProvider.createDonation(donation.toJson());
                      if (result) {
                        donorProvider.updateDonorRecordById(donorId, date);
                      }

                    }
                    else {
                      displayToast("select all the details");
                    }
                  },
                  color: Colors.white,
                  height: 64,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'add'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
