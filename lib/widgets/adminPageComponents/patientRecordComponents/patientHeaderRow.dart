import 'package:flutter/material.dart';

import '../headerTextWidget.dart';

class PatientHeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 200,
            child: HeaderTextWidget(text: 'id'),
          ),
          Container(
            width: 200,
            child: HeaderTextWidget(
              text: 'name',
            ),
          ),
          Container(
            width: 200,
            child: HeaderTextWidget(
              text: 'medical report',
            ),
          ),
          Container(
            width: 200,
            child: HeaderTextWidget(
              text: 'blood group',
            ),
          ),
        ],
      ),
    );
  }
}
