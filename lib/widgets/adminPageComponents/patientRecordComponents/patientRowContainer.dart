import 'package:flutter/material.dart';

import '../normalTextWidget.dart';

class PatientRowContainer extends StatelessWidget {
  final String id;
  final String name;
  final String medicalReport;
  final String bloodGroup;

  PatientRowContainer({
    required this.id,
    required this.name,
    required this.medicalReport,
    required this.bloodGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(3, 3, 3, 1.5),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NormalTextWidget(
              text: id,
            ),
            NormalTextWidget(
              text: name,
            ),
            NormalTextWidget(
              text: medicalReport,
            ),
            NormalTextWidget(
              text: bloodGroup,
            ),
          ],
        ),
      ),
    );
  }
}
