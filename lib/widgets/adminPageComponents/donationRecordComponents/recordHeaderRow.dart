import 'package:flutter/material.dart';

import '../headerTextWidget.dart';

class RecordHeaderRow extends StatelessWidget {
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
            child: HeaderTextWidget(
              text: 'donor id',
            ),
          ),
          Container(
            width: 200,
            child: HeaderTextWidget(
              text: 'patient id',
            ),
          ),
          Container(
            width: 200,
            child: HeaderTextWidget(
              text: 'blood bank',
            ),
          ),
          Container(
            width: 200,
            child: HeaderTextWidget(
              text: 'date',
            ),
          ),
        ],
      ),
    );
  }
}
