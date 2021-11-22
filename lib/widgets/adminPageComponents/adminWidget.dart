import 'package:flutter/material.dart';

import '../../models/enums.dart';
import 'patientsListWidget.dart';
import 'selectionCardWidget.dart';

class AdminWidget extends StatefulWidget {
  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  adminPageWidget pageWidget = adminPageWidget.selection;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (pageWidget == adminPageWidget.patient
          ? PatientsListWidget(
              callback: updateUI,
            )
          : (pageWidget == adminPageWidget.donor
              ? Text('donor')
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
