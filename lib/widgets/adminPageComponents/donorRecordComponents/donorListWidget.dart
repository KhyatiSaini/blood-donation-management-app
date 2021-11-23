import 'package:flutter/material.dart';

import 'donorHeaderRow.dart';
import 'donorRowContainer.dart';
import '../../../models/enums.dart';

class DonorListWidget extends StatelessWidget {
  final Function callback;

  DonorListWidget({
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.redAccent,
                child: IconButton(
                  onPressed: () => callback(adminPageWidget.selection),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'donors record'.toUpperCase(),
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 1,
                color: Colors.blueGrey.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            DonorHeaderRow(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return DonorRowContainer(
                    id: 'id',
                    name: 'name',
                    medicalReport: 'medical report',
                    bloodGroup: 'blood group',
                    contactNumber: 'contact number',
                    latestDonationDate: DateTime.now(),
                  );
                },
                itemCount: 50,
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