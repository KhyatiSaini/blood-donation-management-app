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
  AdminPageWidgetType pageWidget = AdminPageWidgetType.selection;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (pageWidget == AdminPageWidgetType.patient
          ? PatientsListWidget(
              callback: updateUI,
            )
          : (pageWidget == AdminPageWidgetType.donor
              ? DonorListWidget(
                  callback: updateUI,
                )
              : (pageWidget == AdminPageWidgetType.bloodBank)
                  ? BloodBankListWidget(
                      displayBackButton: true,
                      callback: updateUI,
                    )
                  : (pageWidget == AdminPageWidgetType.donationRecord)
                      ? DonationRecordWidget(
                          callback: updateUI,
                        )
                      : SelectionCardWidget(
                          callback: updateUI,
                        ))),
    );
  }

  /// function to update the UI by switching the [AdminPageWidgets]
  updateUI(AdminPageWidgetType widget) {
    setState(() {
      pageWidget = widget;
    });
  }
}
