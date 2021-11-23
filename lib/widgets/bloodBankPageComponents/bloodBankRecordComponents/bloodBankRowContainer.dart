import 'package:flutter/material.dart';

import '../../adminPageComponents/normalTextWidget.dart';

class BloodBankRowContainer extends StatelessWidget {
  final String name;
  final String staffDetails;
  final String operatingHours;
  final String address;

  BloodBankRowContainer({
    required this.name,
    required this.staffDetails,
    required this.operatingHours,
    required this.address,
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
                text: name,
              ),
            ),
            Container(
              width: 200,
              child: NormalTextWidget(
                text: staffDetails,
              ),
            ),
            Container(
              width: 200,
              child: NormalTextWidget(
                text: operatingHours,
              ),
            ),
            Container(
              width: 200,
              child: NormalTextWidget(
                text: address,
              ),
            ),
          ],
        ),
      ),
    );
  }
}