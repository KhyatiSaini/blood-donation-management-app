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
            Expanded(
              child: Container(
                width: 200,
                alignment: Alignment.center,
                child: NormalTextWidget(
                  text: donorId,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 200,
                alignment: Alignment.center,
                child: NormalTextWidget(
                  text: patientId,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 200,
                alignment: Alignment.center,
                child: NormalTextWidget(
                  text: bloodBank,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 200,
                alignment: Alignment.center,
                child: NormalTextWidget(
                  text: date,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}