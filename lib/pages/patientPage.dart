import 'package:blood_donation_management_app/widgets/patientPageComponents/patientCard.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image(image: AssetImage('assets/images/patient.jpg')),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: PatientCard()
          ),
        ],
      ),
    );
  }
}