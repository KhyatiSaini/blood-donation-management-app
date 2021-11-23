import 'package:flutter/material.dart';

import 'patientHeaderRow.dart';
import '../../../models/enums.dart';
import 'patientRowContainer.dart';

class PatientsListWidget extends StatelessWidget {
  final Function callback;

  PatientsListWidget({
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
              'patients record'.toUpperCase(),
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 1,
                color: Colors.blueGrey.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            PatientHeaderRow(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return PatientRowContainer(
                    id: 'id',
                    name: 'name',
                    medicalReport: 'medical report',
                    bloodGroup: 'blood group',
                  );
                },
                itemCount: 50,
              ),
            ),
            Container(
              height: 3,
              color: Colors.redAccent,
              margin: EdgeInsets.symmetric(horizontal: 52),
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
