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
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              child: HeaderTextWidget(
                text: 'id',
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              child: HeaderTextWidget(
                text: 'name',
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              child: HeaderTextWidget(
                text: 'medical condition',
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              child: HeaderTextWidget(
                text: 'blood group',
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              child: HeaderTextWidget(
                text: 'contact number',
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              child: HeaderTextWidget(
                text: 'latest donation date',
              ),
            ),
          )
        ],
      ),
    );
  }
}
