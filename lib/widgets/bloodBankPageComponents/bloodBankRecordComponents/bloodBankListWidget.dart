import 'package:flutter/material.dart';

import 'bloodBankHeaderRow.dart';
import 'bloodBankRowContainer.dart';

class BloodBankListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Blood Banks'.toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 1,
                  color: Colors.blueGrey.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BloodBankHeaderRow(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return BloodBankRowContainer(
                    name: 'name',
                    staffDetails: 'staff details',
                    operatingHours: 'operating hours',
                    address: 'address',
                  );
                },
                itemCount: 5,
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
