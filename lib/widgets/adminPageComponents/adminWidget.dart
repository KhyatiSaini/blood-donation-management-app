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
  AdminPageWidget pageWidget = AdminPageWidget.selection;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (pageWidget == AdminPageWidget.patient
          ? PatientsListWidget(
              callback: updateUI,
            )
          : (pageWidget == AdminPageWidget.donor
              ? DonorListWidget(
                  callback: updateUI,
                )
              : (pageWidget == AdminPageWidget.bloodBank)
                  ? BloodBankListWidget(
                      displayBackButton: true,
                      callback: updateUI,
                    )
                  : (pageWidget == AdminPageWidget.donationRecord)
                      ? DonationRecordWidget(
                          callback: updateUI,
                        )
                      : SelectionCardWidget(
                          callback: updateUI,
                        ))),
    );
  }

  updateUI(AdminPageWidget widget) {
    setState(() {
      pageWidget = widget;
    });
  }
}
