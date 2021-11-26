import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'patientHeaderRow.dart';
import 'patientRowContainer.dart';
import '../../../models/enums.dart';
import '../../../models/patient.dart';
import '../../../providers/patientProvider.dart';

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
                  onPressed: () => callback(AdminPageWidgetType.selection),
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
            SingleChildScrollView(
              child: Container(
                width: 2000,
                child: Column(
                  children: [
                    PatientHeaderRow(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Consumer<PatientProvider>(
                        builder: (context, patientProvider, child) {
                          patientProvider.fetchPatients();
                          final bool isListFetched =
                              patientProvider.isListFetched;
                          List<Patient> patients = [];

                          if (isListFetched) {
                            patients = patientProvider.patients;
                          }

                          return (isListFetched) ? ListView.builder(
                            itemBuilder: (context, index) {
                              return PatientRowContainer(
                                id: patients[index].id.toString(),
                                name: patients[index].name,
                                medicalReport: patients[index].medicalCondition,
                                bloodGroup: patients[index].bloodGroup,
                              );
                            },
                            itemCount: patients.length,
                          ) : Center(
                            child: CircularProgressIndicator(
                              color: Colors.redAccent,
                              strokeWidth: 5,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
