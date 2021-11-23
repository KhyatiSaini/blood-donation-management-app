import 'package:flutter/material.dart';

import 'adminLoginCard.dart';
import '../../models/enums.dart';
import 'selectionCardWidget.dart';
import 'donorRecordComponents/donorListWidget.dart';
import 'patientRecordComponents/patientListWidget.dart';

class AdminWidget extends StatefulWidget {
  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  adminPageWidget pageWidget = adminPageWidget.selection;
  bool adminSignedIn = false;

  @override
  void initState() {
    adminSignedIn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !adminSignedIn ? AdminLoginCard(): Container(
      child: (pageWidget == adminPageWidget.patient
          ? PatientsListWidget(
              callback: updateUI,
            )
          : (pageWidget == adminPageWidget.donor
              ? DonorListWidget(
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
