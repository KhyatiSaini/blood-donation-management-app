import 'package:blood_donation_management_app/widgets/bloodBankPageComponents/bloodBankRecordComponents/bloodBankListWidget.dart';
import 'package:flutter/material.dart';

import '../widgets/bloodBankPageComponents/bloodBankCard.dart';

class BloodBankPage extends StatelessWidget {
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
            child: Image(image: AssetImage('assets/images/bloodbank.jpg')),
          ),
          BloodBankListWidget(),
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: BloodBankCard()
          // ),
        ],
      ),
    );
  }
}