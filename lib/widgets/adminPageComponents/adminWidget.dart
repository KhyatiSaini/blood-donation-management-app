import 'package:flutter/material.dart';

import '../../models/enums.dart';
import 'selectionCardWidget.dart';
import 'donorRecordComponents/donorListWidget.dart';
import 'patientRecordComponents/patientListWidget.dart';
import 'donationRecordComponents/donationRecordWidget.dart';
import '../bloodBankPageComponents/bloodBankRecordComponents/bloodBankListWidget.dart';

class AdminWidget extends StatefulWidget {
  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  adminPageWidget pageWidget = adminPageWidget.selection;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (pageWidget == adminPageWidget.patient
          ? PatientsListWidget(
              callback: updateUI,
            )
          : (pageWidget == adminPageWidget.donor
              ? DonorListWidget(
                  callback: updateUI,
                )
              : (pageWidget == adminPageWidget.bloodBank)
                  ? BloodBankListWidget(
                      displayBackButton: true,
                      callback: updateUI,
                    )
                  : (pageWidget == adminPageWidget.donationRecord)
                      ? DonationRecordWidget(
                          callback: updateUI,
                        )
                      : SelectionCardWidget(
                          callback: updateUI,
                        ))),
    );
  }

  updateUI(adminPageWidget widget) {
    setState(() {
      pageWidget = widget;
    });
  }
}
