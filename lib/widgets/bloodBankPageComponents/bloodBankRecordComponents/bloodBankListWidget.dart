import 'package:flutter/material.dart';

import 'bloodBankHeaderRow.dart';
import '../../../models/enums.dart';
import 'bloodBankRowContainer.dart';

class BloodBankListWidget extends StatelessWidget {
  final bool displayBackButton;
  final Function? callback;

  BloodBankListWidget({
    required this.displayBackButton,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (displayBackButton)
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.redAccent,
                child: IconButton(
                  onPressed: () {
                    callback!(adminPageWidget.selection);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
