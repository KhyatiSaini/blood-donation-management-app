import 'package:flutter/material.dart';

import '../normalTextWidget.dart';

class DonorRowContainer extends StatelessWidget {
  final String id;
  final String name;
  final String medicalReport;
  final String bloodGroup;
  final String contactNumber;
  final String latestDonationDate;

  DonorRowContainer({
    required this.id,
    required this.name,
    required this.medicalReport,
    required this.bloodGroup,
    required this.contactNumber,
    this.latestDonationDate = "-"
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
                alignment: Alignment.center,
                width: 150,
                child: NormalTextWidget(
                  text: id,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 150,
                child: NormalTextWidget(
                  text: name,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 150,
                child: NormalTextWidget(
                  text: medicalReport,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 150,
                child: NormalTextWidget(
                  text: bloodGroup,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 150,
                child: NormalTextWidget(
                  text: contactNumber,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 150,
                child: NormalTextWidget(
                  text: latestDonationDate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}