import 'package:flutter/material.dart';

import '../headerTextWidget.dart';

class DonorHeaderRow extends StatelessWidget {
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
            width: 150,
            child: HeaderTextWidget(
              text: 'id',
            ),
          ),
          Container(
            width: 150,
            child: HeaderTextWidget(
              text: 'name',
            ),
          ),
          Container(
            width: 150,
            child: HeaderTextWidget(
              text: 'medical condition',
            ),
          ),
          Container(
            width: 150,
            child: HeaderTextWidget(
              text: 'blood group',
            ),
          ),
          Container(
            width: 150,
            child: HeaderTextWidget(
              text: 'contact number',
            ),
          ),
          Container(
            width: 150,
            child: HeaderTextWidget(
              text: 'latest donation date',
            ),
          )
        ],
      ),
    );
  }
}
