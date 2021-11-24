import 'package:flutter/material.dart';

import '../normalTextWidget.dart';

class RecordRowContainer extends StatelessWidget {
  final String donorId;
  final String patientId;
  final String bloodBank;
  final String date;

  RecordRowContainer({
    required this.donorId,
    required this.patientId,
    required this.bloodBank,
    required this.date,
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
            Container(
              width: 200,
              child: NormalTextWidget(
                text: donorId,
              ),
            ),
            Container(
              width: 200,
              child: NormalTextWidget(
                text: patientId,
              ),
            ),
            Container(
              width: 200,
              child: NormalTextWidget(
                text: bloodBank,
              ),
            ),
            Container(
              width: 200,
              child: NormalTextWidget(
                text: date,
              ),
            ),
          ],
        ),
      ),
    );
  }
}