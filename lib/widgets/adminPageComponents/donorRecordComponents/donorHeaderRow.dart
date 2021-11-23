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
          HeaderTextWidget(text: 'id'),
          HeaderTextWidget(text: 'name'),
          HeaderTextWidget(text: 'medical condition'),
          HeaderTextWidget(text: 'blood group'),
          HeaderTextWidget(text: 'contact number'),
          HeaderTextWidget(text: 'latest donation date')
        ],
      ),
    );
  }
}