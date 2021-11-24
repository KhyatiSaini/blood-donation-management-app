import 'package:flutter/material.dart';

import 'customCard.dart';
import '../../models/enums.dart';

class SelectionCardWidget extends StatelessWidget {
  final Function callback;

  SelectionCardWidget({
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1000,
        padding: EdgeInsets.symmetric(vertical: 180, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 1200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      imageAsset: 'assets/images/patient.jpg',
                      caption: 'Patients',
                      onTap: () => callback(adminPageWidget.patient),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    CustomCard(
                      imageAsset: 'assets/images/donor.jpg',
                      caption: 'Donors',
                      onTap: () => callback(adminPageWidget.donor),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    CustomCard(
                      imageAsset: 'assets/images/bloodbank.jpg',
                      caption: 'Blood Banks',
                      onTap: () => callback(adminPageWidget.bloodBank),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => callback(adminPageWidget.donationRecord),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: 60,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'manage donation record'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
